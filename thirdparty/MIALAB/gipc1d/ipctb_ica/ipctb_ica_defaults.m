function ipctb_ica_defaults
% All the GIFT toolbox defaults are stored in this file

% colormap info
global COLORMAP_FILE;
global COLORLIST;

% conventions for naming components, timecourses and structural
global COMPONENT_NAMING;
global TIMECOURSE_NAMING;
global STRUCTURAL_NAMING;

% Matlab files
global PARAMETER_INFO_MAT_FILE; %Holds information for group session parameters
global DATA_REDUCTION_MAT_FILE; %A file for each subject's principal components
global ICA_MAT_FILE;
global BACK_RECONSTRUCTION_MAT_FILE;
global CALIBRATE_MAT_FILE;

% Analyze files
global SUBJECT_ICA_AN3_FILE;
global MEAN_AN3_FILE;
global TMAP_AN3_FILE;
global STD_AN3_FILE;
global MEAN_ALL_AN3_FILE; % Mean for different sessions
global SESSION_POSTFIX;
global AGGREGATE_AN3_FILE;

% File Indices
global SUBJECT_ICA_INDEX;
global MEAN_INDEX;
global TMAP_INDEX;
global STD_INDEX;
global MEAN_ALL_INDEX;  % Index for mean over different sessions

% Screen Color Defaults
global BG_COLOR; % Figure background color
global BG2_COLOR; % User Interface background color except pushbutton
global FG_COLOR;
global AXES_COLOR;
global FONT_COLOR; % User Interface foreground color except pushbutton
global LEGENDCOLOR;
global BUTTON_COLOR; % BUTTON background color
global BUTTON_FONT_COLOR; % BUTTON foreground color
global HELP_FONT_COLOR;

% Pictures
global COMPOSITE_VIEWER_PIC;
global COMPONENT_EXPLORER_PIC;
global ORTHOGONAL_VIEWER_PIC;

% display defaults
global SORT_COMPONENTS;
global IMAGE_VALUES;
global CONVERT_Z;
global THRESHOLD_VALUE;
global IMAGES_PER_FIGURE;
global COMPLEX_IMAGES_PER_FIGURE; % for complex data
global ANATOMICAL_PLANE;

% Slice Range defaults
global USE_DEFAULT_SLICE_RANGE;
global SLICE_RANGE;

global ASPECT_RATIO_FOR_SQUARE_FIGURE;
global WS;
global MIN_SCREEN_DIM_IN_PIXELS;
global PERCENT_SCREEN_OCCUPIED;
global S0;

% FONT DEFAULTS
global UI_FONTNAME;
global UI_FONTUNITS;
global UI_FS;

% FUNTIONAL FILE DEFAULTS
% Functional data filter is used as filter in figure windows while reading
% images. This is also the keyword used in writing images (.nii or .img)
global FUNCTIONAL_DATA_FILTER;
global MASK_SCALAR;


% Sorting defaults
global DETRENDNUMBER;
global SMOOTHINGVALUE;
global SMOOTHPARA;

global agg_FileName; % Aggregate File Names

% Flag for displaying acknowledgements of ICA authors
global FLAG_ACKNOWLEDGE_CREATORS;

% ICA options window display default (displays ICA Options)
global ICAOPTIONS_WINDOW_DISPLAY;

% declare vars for storing directory information
global STORE_DIRECTORY_INFORMATION;
global DIRS_TO_BE_STORED;

% method for entering regressors
global METHOD_ENTERING_REGRESSORS;

% text file for entering regressors
global TXTFILE_REGRESSORS;

% Including a global variable to flip images
global FLIP_ANALYZE_IMAGES;

% variable for displaying text for slices
global TEXT_DISPLAY_SLICES_IN_MM;

% variables to detect the reading and writing of complex images
global READ_NAMING_COMPLEX_IMAGES;
global WRITE_NAMING_COMPLEX_IMAGES;

% Event average defaults
global EVENTAVG_WINDOW_SIZE;
global EVENTAVG_INTERP_FACTOR;

% Defaults for printing regressors to text file
global PRINTTYPE_REGRESSORS;

% Zip image files default
global ZIP_IMAGE_FILES;

% default for scaling
global SCALE_DEFAULT;

% Default mask option
global DEFAULT_MASK_OPTION;

% Number of times ICA must Run
global NUM_RUNS_GICA;

% Open display GUI
global OPEN_DISPLAY_GUI;


% EEG display_defaults
global EEG_IMAGE_VALUES;
global EEG_CONVERT_Z;
global EEG_THRESHOLD_VALUE;
global EEG_IMAGES_PER_FIGURE;

global EEG_TOPOPLOT_COLORMAP;

% Naming Convention Output Files( Analyze Format)
COMPONENT_NAMING = '_component_ica_';
TIMECOURSE_NAMING = '_timecourses_ica_';
STRUCTURAL_NAMING = '_structural_ica_';

% Naming Convention Output Files( Matlab Format)
PARAMETER_INFO_MAT_FILE = '_ica_parameter_info';
DATA_REDUCTION_MAT_FILE = '_pca_r';
ICA_MAT_FILE = '_ica';
BACK_RECONSTRUCTION_MAT_FILE = '_ica_br';
CALIBRATE_MAT_FILE = '_ica_c';

% Specific Naming Convention for Component Files( Analyze Format)
SESSION_POSTFIX = 's';

% aggregate file naming
AGGREGATE_AN3_FILE = ['_agg_', COMPONENT_NAMING];

% subject component naming
SUBJECT_ICA_AN3_FILE = '_sub';

% mean file naming
MEAN_AN3_FILE = '_mean'; % mean for a session
MEAN_ALL_AN3_FILE = '_mean'; % mean for all data sets

% tmap file naming
TMAP_AN3_FILE = '_tmap'; % tmap for a session

% std file naming
STD_AN3_FILE = '_std'; % std for a session


% Indicies For Component Files
MEAN_ALL_INDEX = 1; % Mean for all sessions over subjects
MEAN_INDEX = 2;
TMAP_INDEX = 3;
STD_INDEX = 4;
SUBJECT_ICA_INDEX = 5; %5 to (5 + number of subjects)


% Images of the composite viewer, component explorer, Orthoviewer
COMPONENT_EXPLORER_PIC = which('component_explorer_pic.tif');
ORTHOGONAL_VIEWER_PIC = which('orthogonal_viewer_pic.tif');
COMPOSITE_VIEWER_PIC =  which('composite_viewer_pic.tif');

% Name of file with colormaps
COLORMAP_FILE = 'ipctb_ica_colors';

% Filter for selecting Functional Data.
% This is also the image extension used for writing component images
% options are ('*.img' or '*.nii')
% *.img - analyze
% *.nii - Nifti
FUNCTIONAL_DATA_FILTER = '*.img';

% List of colors for plotting
COLORLIST = ['g','r','c','m','y'];

% Screen Color Defaults
BG_COLOR = [.353 .471 .573]; % Figure background color
BG2_COLOR = [.353 .471 .573]; % User Interface controls background color except push button
FG_COLOR = [0 0 0];
FONT_COLOR = [1 1 1]; % User Interface controls foreground color except push button
AXES_COLOR = [0 0 0];
LEGENDCOLOR = [1 1 1];

% Button background and font colors
BUTTON_COLOR = [.6 .6 .6]; %(default is black)
BUTTON_FONT_COLOR = [0 0 0]; %(default is white)
HELP_FONT_COLOR = [.5 0 0]; % default is yellow

% display defaults
SORT_COMPONENTS = 'No'; % options are 'No' and 'Yes'
IMAGE_VALUES = 'Positive'; % options are 'Positive and Negative', 'Positive', 'Absolute Value' and 'Negative'
CONVERT_Z = 'Yes'; % options are 'No' and 'Yes'
THRESHOLD_VALUE = '1.0';
IMAGES_PER_FIGURE = '4'; % options are '1', '4', '9', '16' and '25'
COMPLEX_IMAGES_PER_FIGURE = '2';
ANATOMICAL_PLANE = 'Axial'; % options are 'Axial', 'Sagittal' and 'Coronal'

% Slice Range defaults:
% Options are 1 or 0
% 1 means default slice range mentioned in variable SLICE_RANGE will be used.
% 0 means slice range will be calculated based on the data
USE_DEFAULT_SLICE_RANGE = 0;
SLICE_RANGE = '0:4:72';


% ASPECT RATIO TO MAKE SQUARE DIMENSIONS REALLY SQUARE
% WS = ASPECT RATIO OF THE COMPUTER YOUR LOOKING AT NOW COMPARED TO THE
% COMPUTER THAT GIFT WAS DELELOPED ON
% dimensions for square figure on development computer(in pixels)
dimForSquareFigure = [50 50 853 800];
S0   = get(0,'ScreenSize');
WS = [S0(3)/1280 (S0(4))/960 S0(3)/1280 (S0(4))/960];

xDiff = (dimForSquareFigure(3)*WS(3));
yDiff = (dimForSquareFigure(4)*WS(4));
xRatio = xDiff/yDiff;
yRatio = yDiff/xDiff;
if(xRatio >1)
    xRatio =1;
else
    yRatio =1;
end
%ASPECT_RATIO_FOR_SQUARE_FIGURE = [xRatio yRatio];
ASPECT_RATIO_FOR_SQUARE_FIGURE = [1, 1];
WS = WS;
MIN_SCREEN_DIM_IN_PIXELS=min([S0(3) S0(4)]);
PERCENT_SCREEN_OCUPIED = .9;

% Font Size
UI_FONTNAME = 'times';
UI_FONTUNITS = 'points';
UI_FS = 12;

% Scalar for determining which voxels to use in analysis
MASK_SCALAR = 1;

% Sorting detrend defaults:
% DETRENDNUMBER - case 0 - Removes the mean
% DETRENDNUMBER - case 1 - Removes the mean and linear trend
% DETRENDNUMBER - case 2 - Uses sine and cosine one cycle, removes mean and
% linear trend
% DETRENDNUMBER - case 3 - Uses sine two cycles, cosine two cycles, sine one cycle, cosine one cycle,
% removes mean and inear trend
DETRENDNUMBER = 3;

% Smoothing Defaults
% If you want to smooth time courses - Replace smooth para by yes(lower
% case)
SMOOTHPARA = 'No';
SMOOTHINGVALUE = 1.1;

% Aggregate File Names
agg_FileName = '_aggFileNames';

% Acknowledge creators display ('off' turns off the acknowledgement display)
FLAG_ACKNOWLEDGE_CREATORS = 'off';

% ICA options window display ('off' turns off the options display)
ICAOPTIONS_WINDOW_DISPLAY = 'on';

% Options for storing subject directories in Directory History popup
% control in file selection window.
STORE_DIRECTORY_INFORMATION = 'No'; % flag for storing directories
% Enter the directories to be stored between curly brackets (use comma to
% separate the directories)
DIRS_TO_BE_STORED = {'C:\MATLAB6p5\work\Visuomotor_Data\visomot', 'C:\MATLAB6p5\work\Example Subjects'};

% Method for entering regressors
% options are GUI, BATCH or AUTOMATIC
% 1. GUI - Means GUI will be used to enter regressors.
% 2. BATCH - Means text file specified in the variable TXTFILE_REGRESSORS (see below) will be used.
% 3. AUTOMATIC - Means the regressors will be used automatically and if the
% design matrix is session specific then session related regressors will be
% used. For correlation first regressor for the specified design matrix
% will be used.

% if BATCH is specified (text file can be entered by typing full file path
% for TXTFILE_REGRESSORS variable or by selecting 'Load file for temporal
% sorting' under DISPLAY GUI Options menu).
METHOD_ENTERING_REGRESSORS = 'GUI';

% text file for entering regressors. Default will not be used if Load file for temporal sorting is
% used in DISPLAY GUI OPTIONS MENU.
TXTFILE_REGRESSORS = which('Input_data_regressors_2.m');

% Flip parameter for analyze images
FLIP_ANALYZE_IMAGES = 0;

% Number of times ICA will be run
NUM_RUNS_GICA = 1;

% Text for showing the slices on component explorer and composite viewer
% options are 'on' and 'off'
TEXT_DISPLAY_SLICES_IN_MM = 'on';

% event average window size in seconds
EVENTAVG_WINDOW_SIZE = 30;

% event average interpolation factor
EVENTAVG_INTERP_FACTOR = 5;

% default Print Type for regression parameters
% options are: row_wise, column_wise
PRINTTYPE_REGRESSORS = 'row_wise';

% Zip the image files default
% Options are No, yes
% Zips the image files by viewing set like subject 1 session 1 components,
% Mean for session 1 components, etc.
ZIP_IMAGE_FILES = 'No';

% Options for scaling are in ipctb_ica_scaleICA
% Options are 0, 1 and 2.
% 0 - no scaling, 1 - Calibrate (percent signal change), 2 - Z-scores
SCALE_DEFAULT = 1;


%%% Default mask option
% Mask is calculated by doing a Boolean AND of voxels that surpass or equal the mean.
% Options are 'all_files' and 'first_file'.
% 1. 'all_files' - Uses all files.
% 2. 'first_file' - Uses first file of each subject session.

DEFAULT_MASK_OPTION = 'first_file';

% Variable for reading complex images
% Complex images can be of real&imaginary or magnitude&phase type
% For real&imaginary first field of variable is read and for
% magnitude&phase second field of variable is read.
% Naming should contain _ term to distinguish images (R_ means the real
% images start with R_ and _R means images end with R)
READ_NAMING_COMPLEX_IMAGES.real_imag = {'R_', 'I_'};
READ_NAMING_COMPLEX_IMAGES.mag_phase = {'Mag_', 'Phase_'};
%
% % writing complex data
% % if the data is of type real_imag then first set is used
% % else second set is used
WRITE_NAMING_COMPLEX_IMAGES.real_imag = {'R_', 'I_'};
WRITE_NAMING_COMPLEX_IMAGES.mag_phase = {'Mag_', 'Phase_'};


% Open display GUI after analysis
% Options are 1 and 0.
% 1 means open display GUI
OPEN_DISPLAY_GUI = 1;


% % EEG display defaults
% EEG_IMAGE_VALUES = 'Positive and Negative'; % options are 'Positive and Negative', 'Positive', 'Absolute Value' and 'Negative'
% EEG_CONVERT_Z = 'Yes'; % options are 'No' and 'Yes'
% EEG_THRESHOLD_VALUE = '1.0';
% EEG_IMAGES_PER_FIGURE = '4'; % options are '1', '4', '9'
% 
% EEG_TOPOPLOT_COLORMAP = jet(64);