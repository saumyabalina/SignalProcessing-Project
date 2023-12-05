%% Function 3: Cancel echo

function y = echoCancellation(echoSignal, sampling_freq)
    autocorr_result = xcorr(echoSignal);
    autocorr_result = autocorr_result(length(echoSignal):end);

    [peaks, locs] = findpeaks(autocorr_result);

    indices = locs;
    
    while(issorted(peaks,'descend') ~= 1)
        [peaks, locs] = findpeaks(peaks);
        indices = indices(locs);
    end

    locs = indices;
    
    D = zeros(1,length(locs)); D(1) = locs(1); 
    alpha = zeros(1,length(locs));
    alpha(1) = peaks(1)/autocorr_result(1);

    for k = 2:length(locs)
        D(k) = locs(k) - locs(k-1);
        alpha(k) = peaks(k)/autocorr_result(1);
        % alpha(k) = alpha(k-1)*alpha(1);
    end
    
    % Filter parameters
    b = 1;
    a = 1; 
    for k = 1:numel(D)
        a = [a zeros(1,D(k)-1) alpha(k)];
    end
    
    y = filter(b,a,echoSignal);

    disp("Original Signal");
    sound(echoSignal, sampling_freq); pause(length(echoSignal)/sampling_freq + sampling_freq);

    disp("Sound without echo");
    sound(y,sampling_freq);

    % OPTIONAL: Plot the original signal and signal without echo
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