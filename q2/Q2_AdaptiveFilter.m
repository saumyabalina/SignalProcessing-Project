[x,fs_x] = audioread('q1_hard_ans.wav');
[d,fs_d] = audioread('q1_hard.wav');

d = checkAudioFile(d);
N = numel(x);
f_order = 15;
beta = 0.25;

[e,y,w] = AdaptiveFilter_NLMS(x,d,N,f_order,beta);
% [e,y,w] = myNLMS(x,d,beta,f_order,N);

figure;
subplot(2,1,1);
plot(y); title('Output Signal');
subplot(2,1,2);
plot(d);title('Desired Output');
% legend('desired','output');
% sound(d,fs_d); pause(length(d)/fs_d);
sound(y,fs_d);