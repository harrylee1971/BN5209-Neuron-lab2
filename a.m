
[data, fs] = audioread('e1.wav');

[y, x] = findpeaks(data(:,1), 'MinPeakHeight', 0.1);
[y2, x2] = findpeaks(data(:, 2), 'MinPeakHeight', 0.1);

for i = 1:2
    if i == 1
        subplot(2, 1, i)
        plot(data(:, 1))
        hold on
        plot(x, y, 'o')
        title('Channel 1 Peaks');
    else
        subplot(2, 1, i)
        plot(data(:, 2))
        hold on
        plot(x2, y2, 'o')
        title('Channel 2 Peaks');
    end
end