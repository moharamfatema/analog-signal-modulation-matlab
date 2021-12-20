function [] = plotFrequency(signalFrequency,signalFrequencyShifted,fs)
%PLOTFREQUENCY Summary of this function goes here
%   Detailed explanation goes here
figure;
f = linspace(0,fs.*size(signalFrequency,1),fs);
subplot(2,1,1);
plot(real(signalFrequency));
subplot(2,1,2);
plot(real(signalFrequencyShifted));
end

