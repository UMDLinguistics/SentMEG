%%SentMEG.m is a basic script for presenting text experiments in MEG at UMD
%%The goal is that many users would be able to use the same script by
%%making changes to the input files but not the script itself.

%%If you find that SentMEG.m is missing some functionality that you need,
%%rather than just creating your own modified version for personal use, 
%%please let someone like a lab manager know so that the main script can be 
%%improved for everyone!

%%If you're trying to understand the  SentMEG.m script for the first time, try collapsing
%%all of the functions so you can see the overarching structure

%%Useful fact: if the program freezes while the screen is black you can
%%escape by typing ctrl-c and hitting return, then "sca" and hitting return 
%%(you may need to do it more than once 


%% Input files required to run SentMEG: (see SentMEG_Example for examples)

A. Experiment File (select first)
%Experiment File must be a text file ending in '.expt'.
%Each line of text in the text file is either:
%%%a) a filename of a textfile in the same directory as the experiment
%%%   file.
%%%b) a variable that will be used to prompt the experimenter to locate
%%%   a text file that will be read into the experiment (either in the 
%%%   same directory as the experiment file or in another directory).

%%%The information that the experiment file is recording is the ORDER in
%%%which the information contained in the other text files should be
%%%displayed.


B. Parameter File (select second)
%Parameter File must be a text file ending in '.par'.

C. TextFiles (with text content to be presented)
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
%%%of the experiment telling the participant they are done. You can have
%%%multiple textslides in a single file (e.g. if you have multiple 
%%%introductory screens, you might want to save them all in one file), as 
%%%long as the text for each screen is enclosed between '<textslide>' and 
%%%'</textslide>'.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Basics of SentMEG script

%The SentMEG.m script contains a main SentMEG() function that loads
%parameters and stimuli for experiment and then calls an embedded series of functions
%to run the experiment, as schematized below


               SentMEG 
                  |
            RunExperiment
            |           |
      RunTextSlide     RunBlock
                       |      |
                    RunItem   RunQuestion
                    
                    
%If you're interested in examining how the trigger is timed relative to the
%stimuli, the function you probably want to check out is RunItem


%% Notable points about SentMEG

%1. Stimulus and timing info is logged *after* each item is completely
%presented (e.g. in a sentence experiment, after the sentence is over).
%This means that if the experiment is aborted for some reason, you will
%still have all the stimulus presentation information logged except for the
%current item. Since data is only logged after sentence presentation is
%over, the logging process doesn't interfere with stimulus timing
%performance. 

%2. Trigger is sent *after* the 'Screen' command to present the stimulus.
%Screen will not return to the next line until the monitor is starting to
%present the stimulus, in other words, it will wait for the next refresh to
%return. Therefore, sending the trigger after the 'Screen' command means
%that the trigger cannot be jittered as a function of monitor refresh rate
%(note that if you are projecting stimuli, you need to make sure that the
%projector refresh is locked to the monitor to preserve this relationship).
%Then, the only place where stimulus-trigger timing jitter can be
%introduced is if the computer is doing other processes between the
%'Screen' command and the subsequent command to output the trigger. 

%There could (and likely will) still be a constant delay between the 
%stimuli and the trigger, that you should measure. As of 10/15/12, this
%delay is not compensated for within the SentMEG script, and should instead
%be compensated for by measuring it with an oscilloscope and subtracting 
%it in post-processing. 


            

