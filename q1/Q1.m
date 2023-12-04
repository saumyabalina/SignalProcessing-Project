% Main script

inputAudioFile = 'q1.wav';

% Step 1: Load input audio file
[Y, Fs] = loadAudioFile(inputAudioFile);

% Step 2: Check if input audio file is stereo or mono
% and get audio file y from it
y = checkAudioFile(Y);

% Echo parameters
alpha = 0.25; D = 2*Fs;

% Step 3: Create echo and play original and echo audio
x = echoCreation(y, alpha, D);

% % OPTIONAL
% % Step 4: Save the output audio
% outputAudioFile = "q1_ans.wav";
% saveOutputAudio(outputAudioFile,x,Fs);