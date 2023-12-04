%% Main script

inputAudioFile = 'music_city-traffic.wav';

% Step 1: Load input audio file
[x, fs] = loadAudioFile(inputAudioFile);

% Step 2: Check if input audio file is stereo or mono
% and get audio file y from it
x = checkAudioFile(x);

% Step 3: Classify the noise
noiseType = classifyNoise(x);

fprintf('\n');
disp(['The detected noise type is: ', noiseType]);