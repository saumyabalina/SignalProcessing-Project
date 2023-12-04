%% Main script

inputAudioFile = 'q1_hard_ans.wav';
desiredAudioFile = 'q1_hard.wav';

% Step 1: Load input audio file and desired audio file
[x, fs_x] = loadAudioFile(inputAudioFile);
[d, fs_d] = loadAudioFile(desiredAudioFile);

% Step 2: Check if input and desired audio files are stereo or mono
% and convert to mono audio
x = checkAudioFile(x);
d = checkAudioFile(d);

% Filter parameters
N = numel(x);
f_order = 15;
beta = 0.25;

% Step 3: Cancel echo and play audio with and without echo
y = echoCancellation(x, d, N, f_order, beta,fs_x);

% % OPTIONAL
% % Step 4: Save the output audio
% outputAudioFile = "q2_hard_ans.wav";
% saveOutputAudio(outputAudioFile,y,fs_x);