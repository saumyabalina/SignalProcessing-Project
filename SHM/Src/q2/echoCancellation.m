%% Function 3: Cancel echo

function y = echoCancellation(echoSignal, desiredSignal, N, filterOrder, beta, Fs)
    % Use adaptive filter (NLMS algorithm) for echo cancellation
    y = AdaptiveFilter_NLMS(echoSignal, desiredSignal, N, filterOrder, beta);
    
    disp("Original Signal");
    sound(echoSignal,Fs); pause(length(echoSignal)/Fs);

    disp("Sound without echo");
    sound(y,Fs);

    % % OPTIONAL: Plot the original signal and signal without echo
    figure;
    subplot(2,1,1);
    plot(echoSignal);
    xlabel('time(samples)');
    ylabel('Amplitude');
    xlim([0 length(echoSignal)]);
    ylim([-1.5 1.5]);
    title('Original Signal');
    subplot(2,1,2);
    plot(y);
    xlabel('time(samples)');
    ylabel('Amplitude');
    xlim([0 length(y)]);
    ylim([-1.5 1.5]);
    title('Sound without echo');
end