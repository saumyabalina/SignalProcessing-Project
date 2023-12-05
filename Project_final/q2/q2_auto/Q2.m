%% Main script

inputAudioFile = 'q2_easy.wav';

% Step 1: Load input audio file audio file
[x, Fs] = loadAudioFile(inputAudioFile);

% Step 2: Check if input audio file is stereo or mono
% and convert to mono audio
x = checkAudioFile(x);

% Step 3: Cancel echo and play audio with and without echo
y = echoCancellation(x, Fs);

% % OPTIONAL
% % Step 4: Save the output audio
% outputAudioFile = "q2_ans.wav";
% saveOutputAudio(outputAudioFile,y,Fs);