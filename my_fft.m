clc;clear
[data, fs] = audioread('Exp 1 Posterior.wav');

fft_data = fft(data);

x = ((1:length(fft_data))-1) * fs / length(fft_data);
y = abs(fft_data) .^ 2;

plot(x, y(:, 1))
xlim([0 5000])