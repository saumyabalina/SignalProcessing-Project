%% Main script

inputAudioFile = 'hindi_2s_recent.wav';
desiredAudioFile = 'hindi_2s.wav';

% Step 1: Load input audio file and desired audio file
[x, fs_x] = loadAudioFile(inputAudioFile);
[d, fs_d] = loadAudioFile(desiredAudioFile);

% Step 2: Check if input and desired audio files are stereo or mono
% and convert to mono audio
x = checkAudioFile(x);
d = checkAudioFile(d);
d = [d;(zeros(2*fs_d,1))];

% Filter parameters
N = numel(x);
f_order = 25;
beta = 0.01;

% Step 3: Cancel echo and play audio with and without echo
y = echoCancellation(x, d, N, f_order, beta,fs_x);

% % OPTIONAL
% % Step 4: Save the output audio
outputAudioFile = "hindi_2s_without_echo_ans.wav";
saveOutputAudio(outputAudioFile,y,fs_x);