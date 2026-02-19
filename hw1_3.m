clc;clear;
[data, fs] = audioread('Exp 2 Anterior.wav');
difference_array = [];
% 
[y, x] = findpeaks(data(:,1), 'MinPeakHeight', 0.015, 'MinPeakDistance',210);
[y2, x2] = findpeaks(data(:, 2), 'MinPeakHeight', 0.015, 'MinPeakDistance',210);
% figure;
% for i = 1:2
%     if i == 1
%         subplot(2, 1, i)
%         plot(data(:, 1))
%         hold on
%         plot(x, y, 'o')
%         title('Channel 1 Peaks');
%     else
%         subplot(2, 1, i)
%         plot(data(:, 2))
%         hold on
%         plot(x2, y2, 'o')
%         title('Channel 2 Peaks');
%     end
% end
%前三個點可以
%%
[data, fs] = audioread('Exp 2 Anterior.wav');


data = data(24700:40050, :);
[y, x] = findpeaks(data(:,1), 'MinPeakHeight', 0.015, 'MinPeakDistance',210);
[y2, x2] = findpeaks(data(:, 2), 'MinPeakHeight', 0.015, 'MinPeakDistance',210);
% figure;
% for i = 1:2
%     if i == 1
%         subplot(2, 1, i)
%         plot(data(:, 1))
%         hold on
%         plot(x, y, 'o')
%         title('Channel 1 Peaks');
%     else
%         subplot(2, 1, i)
%         plot(data(:, 2))
%         hold on
%         plot(x2, y2, 'o')
%         title('Channel 2 Peaks');
%     end
% end
diff = zeros(1, length(y));
for i = 1:length(y)
    diff(i) = abs(x(i) - x2(i));
end
difference_array = [difference_array diff];
%%
[data, fs] = audioread('Exp 2 Anterior.wav');


data = data(380737:492541, :);
[y, x] = findpeaks(data(:,1), 'MinPeakHeight', 0.026, 'MinPeakDistance',210);
[y2, x2] = findpeaks(data(:, 2), 'MinPeakHeight', 0.015, 'MinPeakDistance',210);

[y3, x3] = findpeaks(data(x2(end)-50:x2(end)+50, 1), 'MinPeakHeight',0.015)
y = [y; y3];
x = [x; x3 + x2(end)-50];
diff = zeros(1, length(y));
for i = 1:length(y)
    diff(i) = abs(x(i) - x2(i));
end
difference_array = [difference_array diff];
% figure;
% for i = 1:2
%     if i == 1
%         subplot(2, 1, i)
%         plot(data(:, 1))
%         hold on
%         plot(x, y, 'o')
%         title('Channel 1 Peaks');
%     else
%         subplot(2, 1, i)
%         plot(data(:, 2))
%         hold on
%         plot(x2, y2, 'o')
%         title('Channel 2 Peaks');
%     end
% end
%%
[data, fs] = audioread('Exp 2 Anterior.wav');


data = data(509350:514124, :);
[y, x] = findpeaks(data(:,1), 'MinPeakHeight', 0.015, 'MinPeakDistance',210);
[y2, x2] = findpeaks(data(:, 2), 'MinPeakHeight', 0.015, 'MinPeakDistance',210);

diff = zeros(1, length(y));
for i = 1:length(y)
    diff(i) = abs(x(i) - x2(i));
end
difference_array = [difference_array diff];
% figure;
% for i = 1:2
%     if i == 1
%         subplot(2, 1, i)
%         plot(data(:, 1))
%         hold on
%         plot(x, y, 'o')
%         title('Channel 1 Peaks');
%     else
%         subplot(2, 1, i)
%         plot(data(:, 2))
%         hold on
%         plot(x2, y2, 'o')
%         title('Channel 2 Peaks');
%     end
% end
difference_array = sort(difference_array);
Most_diff_pts = 13; % pts / fs = time(s)
most_diff_time = 13 / fs;
distance = 1.5;%cm
Velo = distance / most_diff_time; %(cm/s)