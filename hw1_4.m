clc;clear;
[data, fs] = audioread('Exp 2 Posterior.wav');
difference_array = [];
% 
[y, x] = findpeaks(data(:,1), 'MinPeakHeight', 0.02, 'MinPeakDistance',210);
[y2, x2] = findpeaks(data(:, 2), 'MinPeakHeight', 0.015, 'MinPeakDistance',210);
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
%前三個點可以
%%
[data, fs] = audioread('Exp 2 Posterior.wav');


[y, x] = findpeaks(data(:,1), 'MinPeakHeight', 0.015, 'MinPeakDistance',210);
[y2, x2] = findpeaks(data(:, 2), 'MinPeakHeight', 0.015, 'MinPeakDistance',210);
window = 50;
arr = [];
xx1 = [];
for i = 1:length(x)
    candidate = x2(abs(x2 - x(i)) < window); %把每一個x2 array數值拿去減現在目前的x(i)1    1W
    if ~isempty(candidate)
        [~, idx] = min(abs(candidate - x(i)));
        nearest = candidate(idx);
        arr = [arr nearest];
        xx1 = [xx1 x(i)]; %因為有些x(i)不存在candidate
    end
end

diff = sort(abs(xx1 - arr));

difference_array = [difference_array diff];
