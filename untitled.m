clc;clear
[data, fs] = audioread('Exp 1 Posterior.wav');
[b, a] = butter(2, 2 * 100 / fs, 'low');
data_new = zeros(length(data), 2);

[bN, aN] = butter(2, [500 2000] /(fs/2), 'bandpass');
data_new = filtfilt(bN, aN, data(:, 1));

subplot(2, 1, 1)
plot(data(:, 1))
subplot(2, 1, 2)
plot(data_new(:, 1))

% fft_data = fft(data_new);
% 
% x = ((1:length(fft_data))-1) * fs / length(fft_data);
% y = abs(fft_data) .^ 2;
% 
% plot(x, y(:, 1))
% xlim([0 5000])