clc;clear;
[data, fs] = audioread('Exp 1 Posterior.wav');
difference_array = [];
% 
[y, x] = findpeaks(data(:,1), 'MinPeakHeight', 0.03, 'MinPeakDistance',210);
[y2, x2] = findpeaks(data(:, 2), 'MinPeakHeight', 0.03, 'MinPeakDistance',210);
figure;
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

%%
[data, fs] = audioread('Exp 1 Posterior.wav');


data = data(348062:393534, :);
[y, x] = findpeaks(data(:,1), 'MinPeakHeight', 0.02, 'MinPeakDistance',210);
[y2, x2] = findpeaks(data(:, 2), 'MinPeakHeight', 0.02, 'MinPeakDistance',210);
figure;
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
diff = zeros(1, length(y));
for i = 1:length(y)
    diff(i) = abs(x(i) - x2(i));
end
difference_array = [difference_array diff];
%%
[data, fs] = audioread('Exp 1 Posterior.wav');


data = data(416617:444457, :);
[y, x] = findpeaks(data(:,1), 'MinPeakHeight', 0.031, 'MinPeakDistance',210);
[y2, x2] = findpeaks(data(:, 2), 'MinPeakHeight', 0.031, 'MinPeakDistance',210);

diff = zeros(1, length(y));
for i = 1:length(y)
    diff(i) = abs(x(i) - x2(i));
end
difference_array = [difference_array diff];
figure;
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
%%
[data, fs] = audioread('Exp 1 Posterior.wav');


data = data(251861:327350, :);
[y, x] = findpeaks(data(:,1), 'MinPeakHeight', 0.026, 'MinPeakDistance',210);
[y2, x2] = findpeaks(data(:, 2), 'MinPeakHeight', 0.021, 'MinPeakDistance',210);

diff = zeros(1, length(y));
for i = 1:length(y)
    diff(i) = abs(x(i) - x2(i));
end
difference_array = [difference_array diff];
figure;
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
difference_array = sort(difference_array);
Most_diff_pts = 13; % pts / fs = time(s)
most_diff_time = 13 / fs;
distance = 1.5;%cm
Velo = distance / most_diff_time; %(cm/s)