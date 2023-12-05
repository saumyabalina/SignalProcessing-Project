[x, Fs] = audioread('max_echo.wav');

autocorr_result = xcorr(x);
autocorr_result = autocorr_result(length(x):end);

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
    % alpha(k) = peaks(k)/autocorr_result(1);
    alpha(k) = alpha(k-1)*alpha(1);
end

b = 1;
a = 1;

for k = 1:numel(D)
    a = [a zeros(1,D(k)-1) alpha(k)];
end

y = filter(b,a,x);

sound(x, Fs); pause(length(x)/Fs);
pause(2);
sound(y, Fs);

% figure;
% subplot(2,1,1);
% plot(x);
% title('Original Signal'); xlim([0 numel(x)]);
% xlabel('time(Samples)');
% ylabel('Amplitude');
% grid on;
% 
% subplot(2,1,2);
% plot(autocorr_result); xlim([0 numel(x)]);
% title('Autocorrelation');
% xlabel('Lag');
% ylabel('Autocorrelation');
% grid on;

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

audiowrite('max_echo_ans.wav', y, Fs);