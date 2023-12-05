[x, Fs] = audioread('max_echo.wav');

y = cancelEcho(x);

disp('Original Signal');
sound(x, Fs); pause(length(x)/Fs);
pause(2);
disp('Echo removed signal');
sound(y, Fs);

figure;
subplot(2,1,1);
plot(x);
title('Original Signal'); xlim([0 numel(x)]);
xlabel('time(Samples)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(y); xlim([0 numel(x)]);
xlabel('Samples');
ylabel('Amplitude');
title('Sound without echo');
grid on;

audiowrite('q2_not_so_easy_ans.wav', y, Fs);