function matlabbatch = bspm_level1(images, general_info, runs, contrasts)
% BSPM_LEVEL1
%
%   USAGE: matlabbatch = bspm_level1(images, general_info, runs, contrasts)
%
%   ARGUMENTS:
%
%       images:                 nruns x 1 cell array with functional image files
% 
%       general_info - structure with the following fields:
%           analysis:           path for the analysis
%           TR:                 repetition time (in seconds)
%           mt_res:             microtime resolution (number of time bins per scan)
%           mt_onset:           microtime onset
%           hpf:                high-pass filter cutoff to use (in seconds)
%           hrf_derivs:         temporal(1) and/or dispersion(2), e.g. [1 1] = use both
%           autocorrelation:    0=None, 1=AR(1), 2=Weighted Least Squares (WLS)
%           nuisance_file:      txt file with nuisance regressors (leave empty for none)
%           brainmask:          brainmask to use (leave empty for none)
%           maskthresh:         masking threshold (proportion of globals), default = -Inf
%           orth:               0 = do not orthogonalise pmod regressors (default), 1 = do
% 
%       runs - structure with the following fields
%           conditions:
%               name:           string naming the condition
%               onsets:         onsets
%               durations:      durations
%               parameters:     for building parametric modulators (leave empty for none)
%                   name:       string naming the paramter
%                   values:     parameter values
%           regressors:         for regressors not convolved with the HRF (e.g., motion)
%               name:           string naming the regressors
%               values:         regressors values (1 x nscans)
% 
%       contrasts - structure with the following fields
%           type:               'T' or 'F'
%           name:               string naming the contrast
%           weights:            vector of contrast weights
%           repl_tag:           tag to replicate weights across sessions (default = 1)
%

% --------------------------------- Copyright (C) 2014 ---------------------------------
%	Author: Bob Spunt
%	Affilitation: Caltech
%	Email: spunt@caltech.edu
%
%	$Revision Date: Aug_20_2014
if nargin < 3, disp('USAGE: matlabbatch = bspm_level1(images, general_info, runs, contrasts)'); return; end
docon = 1; if nargin < 4, docon = 0; end

% | Assign Defaults
if ~isfield(general_info, 'mt_res'), general_info.mt_res = 16; end
if ~isfield(general_info, 'mt_onset'), general_info.mt_onset = 1; end
if ~isfield(general_info, 'hrf_derivs'), general_info.hrf_derivs = [0 0]; end
if ~isfield(general_info, 'maskthresh'), general_info.maskthresh = -Inf; end
if ~isfield(general_info, 'orth'), general_info.orth = 0; end
if ~isfield(general_info, 'write_residuals'), general_info.write_residuals = 0; end
if isempty(general_info.brainmask), general_info.brainmask = ''; end
if isempty(general_info.nuisance_file), general_info.nuisance_file = ''; end

% | Session Non-Specific Parameters
if ~exist(general_info.analysis, 'dir'), mkdir(general_info.analysis); end
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.dir{1} = general_info.analysis;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.timing.units = 'secs';
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.timing.RT = general_info.TR;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.timing.fmri_t = general_info.mt_res;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.timing.fmri_t0 = general_info.mt_onset; 
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.bases.hrf.derivs(1) = general_info.hrf_derivs(1); % time derivative (0=no, 1=yes)
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.bases.hrf.derivs(2) = general_info.hrf_derivs(2); % dispersion derivative (0=no, 1=yes)
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.volt = 1;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.global = 'None';
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.mask{1} = general_info.brainmask;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.mthresh = general_info.maskthresh; 
opt = {'none' 'AR(1)' 'FAST' 'wls'};
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.cvi = opt{general_info.autocorrelation+1}; 

% | Session Specific Parameters
nruns = length(runs);
if nruns==0, runs.conditions = []; nruns = 1; end
for r = 1:nruns
    regressors = []; 
    if nruns==1
        cimages = images;
        conditions = runs.conditions;
        nuisance = general_info.nuisance_file;
        if isfield(runs, 'regressors'), regressors = runs.regressors; end
            
    else
        cimages = images{r};
        conditions = runs(r).conditions;
        nuisance = general_info.nuisance_file{r};
        if isfield(runs(r), 'regressors'), regressors = runs(r).regressors; end
    end
    matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess(r).scans = cimages;
    for c = 1:length(conditions)
        matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess(r).cond(c).name = conditions(c).name;
        matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess(r).cond(c).onset = conditions(c).onsets;
        matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess(r).cond(c).duration = conditions(c).durations;
        matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess(r).cond(c).tmod = 0;
        if isfield(conditions(c), 'parameters')
            parameters = conditions(c).parameters;
            for p = 1:length(parameters)
                matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess(r).cond(c).pmod(p).name = parameters(p).name;
                matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess(r).cond(c).pmod(p).param = parameters(p).values;
                matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess(r).cond(c).pmod(p).poly = 1;
            end
            matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond.orth = general_info.orth;
        end  
    end
    if ~isempty(regressors)
        for p = 1:length(regressors)
            matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess(r).regress(p).name = regressors(p).name;
            matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess(r).regress(p).val = regressors(p).values;
        end
    end  
    matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess(r).multi{1} = '';
    matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess(r).multi_reg{1} = nuisance;
    matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess(r).hpf = general_info.hpf;
end
   
% | Estimation Job
matlabbatch{2}.spm.tools.rwls.fmri_rwls_est.spmmat{1} = [general_info.analysis filesep 'SPM.mat'];
matlabbatch{2}.spm.tools.rwls.fmri_rwls_est.write_residuals = general_info.write_residuals; 
matlabbatch{2}.spm.tools.rwls.fmri_rwls_est.method.Classical = 1;     

% | Contrast Job
if docon
    matlabbatch{3}.spm.stats.con.spmmat{1} = fullfile(general_info.analysis, 'SPM.mat');
    matlabbatch{3}.spm.stats.con.delete = 1;   
    for c = 1:length(contrasts)
        if ~isfield(contrasts(c), 'repl_tag'), repl_tag = 1;
        else repl_tag = contrasts(c).repl_tag; end
        if repl_tag, repl_choice = 'repl'; else repl_choice = 'none'; end
        if strcmpi(contrasts(c).type, 'T')
            matlabbatch{3}.spm.stats.con.consess{c}.tcon.name = contrasts(c).name;
            matlabbatch{3}.spm.stats.con.consess{c}.tcon.weights = contrasts(c).weights;
            matlabbatch{3}.spm.stats.con.consess{c}.tcon.sessrep = repl_choice;
        else
            matlabbatch{3}.spm.stats.con.consess{c}.fcon.name = contrasts(c).name;
            matlabbatch{3}.spm.stats.con.consess{c}.fcon.sessrep = repl_choice;
            weights = contrasts(c).weights;
            for r = 1:size(weights,1)
                matlabbatch{3}.spm.stats.con.consess{c}.fcon.convec{r} = weights(r,:);
            end
        end
    end
end

% | Run job (only if no output arguments requested)
if nargout==1, spm('defaults','fmri'); spm_jobman('run',matlabbatch); end

end

 
 
 
 