%% Function 2: Check if signal is mono or stereo and change accordingly

function y = checkAudioFile(Y)
    if(width(Y)==2)
        % Input signal is stereo so taking mean along its dimension
        y = mean(Y,width(Y));
    else
        % Input signal is mono so taking same signal
        y = Y;
    end
end