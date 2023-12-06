%% Main script

inputAudioFile = 'ipl-9284.wav';

% Step 1: Load input audio file
[y, Fs] = loadAudioFile(inputAudioFile);

% Step 2: Check if input audio file is stereo or mono
% and get audio file y from it
y = checkAudioFile(y);
y = [y; zeros(2*Fs, 1)];

% Echo parameters
alpha = 0.25; D = Fs;

% Step 3: Create echo and play original and echo audio
x = echoCreation(y, alpha, D, Fs);

% % OPTIONAL
% % Step 4: Save the output audio
outputAudioFile = "ipl-9284_recent.wav";
saveOutputAudio(outputAudioFile,x,Fs);