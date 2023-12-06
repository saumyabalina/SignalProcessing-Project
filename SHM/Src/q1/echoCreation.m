%% Function 3: Echo creation using given parameters 

function x = echoCreation(y, attenuation, delay, Fs)
    % b = [1,zeros(1,D-1),alpha,zeros(1,D-1),alpha^2,zeros(1,D-1),alpha^3,zeros(1,D-1),alpha^4];
    % a = 1;
    b = [1,zeros(1,delay-1),attenuation];
    a = [1,zeros(1,delay-1),-attenuation];

    x = filter(b,a,y);

    disp("Original Signal");
    sound(y,Fs); pause(length(y)/Fs);

    disp("Sound with echo");
    sound(x,Fs);
    
    % Optionally, plot the original signal and echoed signal
    figure;
    subplot(2,1,1);
    plot(y);
    xlabel('time(samples)');
    ylabel('Amplitude');
    xlim([0 length(y)]);
    ylim([-1.5 1.5]);
    title('Original Signal');
    subplot(2,1,2);
    plot(x);
    xlabel('time(samples)');
    ylabel('Amplitude');
    xlim([0 length(x)]);
    ylim([-1.5 1.5]);
    title('Sound with echo');
end