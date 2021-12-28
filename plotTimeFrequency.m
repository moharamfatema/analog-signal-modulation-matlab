function [] = plotTimeFrequency(messageTime,name,rows,columns,no,info)
%PLOTTIMEFREQUENCY Summary of this function goes here
%   Detailed explanation goes here
subplot(rows,columns,no);
t = 0:info.SampleRate:info.Duration;
plot(t,messageTime);
title(name , ' in Time Domain');

f = abs(fftshift(fft(messageTime)));

subplot(rows,columns,no+columns);
plot(f);
title(strcat('Normalized ', name ),' in Frequency Domain');
end

