%% Function 5: Save output audio to a file

function saveOutputAudio(outputAudioFileName, audio, sampling_freq)
    audiowrite(outputAudioFileName, audio, sampling_freq);
end