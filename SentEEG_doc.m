%For tutorial, run "sentEEG", select .expt file "example.expt"
%in the example_experiment folder, then select "example.par" as the
%parameter file, enter whatever subjectID you want.

%NOTE: at present, if the same subjectID is entered twice the
%log and rec files named subjectID_experimentName.log and 
%subjectID_experimentName.rec in the same folder as the .expt file
%will be overwritten!

%%Files to Select:
%%A. Parameter File (select second)
%%%Parameter File must be a text file ending in '.par'.
%%%For an example template, open the folder example_experiment on the Desktop
%%%and open the textfile 'example.par'.
%%%Necessary parameters are:
%%%wordDuration IWI fixDuration IFI qDuration IQI ITI textSize.
%%%Other parameters have default values hard-coded into SentEEG.m that can
%%%also be changed by resetting them in the parameter file.

%%B. Experiment File (select first)
%%%Experiment File must be a text file ending in '.expt'.
%%%Each line of text in the text file is either:
%%%a) a filename of a textfile in the same directory as the experiment
%%%   file.
%%%b) a variable that will be used to prompt the experimenter to locate
%%%   a text file that will be read into the experiment (either in the 
%%%   same directory as the experiment file or in another directory).

%%%This enables part of each experiment to remain constant while other
%%%parts are set each time the experiment is run.

%%%The information that the experiment file is recording is the ORDER in
%%%which the information contained in the other text files should be
%%%displayed.

%%%The text files referenced in the experiment file contain text of two
%%%types:

%%%Type 1: Stimulus Item
%%%Each line of text is a trial
%%%A trigger must be specified for each new visual input in main part of
%%%trial. So for a sentence, need to provide a trigger after each word.
%%%E.g. 'The 23 girl 24 went 25 to 13 the 9 store. 7'
%%%If the trial is followed by any special response screen, the last
%%%trigger of the sentence must be followed by a ? in the same row, then a
%%%trigger number for the response screen, and then the response screen 
%%%stimulus in double quotes. Currently can only be presented on one line.
%%%E.g. '...the 9 store. 7 ? 101 "Did the girl go to the store?" or
%%%'...the 9 store. 7 ? 101 "ACCEPT/REJECT?"

%%%Type 2: Text Slide
%%%Starts with a line '<textslide>' and ends with a line '</textslide>'.
%%%All lines in between are text that will be displayed on the screen at one
%%%time, for example, an instructions slide, break slide, or slide at the end
%%%of the experiment telling the participant they are done.

%%Useful fact: if the program freezes while the screen is black you can
%%escape by typing "sca" and hitting return (you may need to do it more
%%than once since the first time MATLAB might think it is the command "jjfjsca"
%%or something and not recognize it.)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
