%% Main script

inputAudioFile = 'q1_hard.wav';

% Step 1: Load input audio file
[y, Fs] = loadAudioFile(inputAudioFile);

% Step 2: Check if input audio file is stereo or mono
% and get audio file y from it
y = checkAudioFile(y);

% Echo parameters
alpha = 0.25; D = Fs;

% Step 3: Create echo and play original and echo audio
x = echoCreation(y, alpha, D, Fs);

% % OPTIONAL
% % Step 4: Save the output audio
outputAudioFile = "q1_hard_ans.wav";
saveOutputAudio(outputAudioFile,x,Fs);