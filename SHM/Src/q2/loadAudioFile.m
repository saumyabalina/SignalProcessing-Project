%% Function 1: Load input audio file

function [audio, sampling_freq] = loadAudioFile(fileName)
    [audio, sampling_freq] = audioread(fileName);
end