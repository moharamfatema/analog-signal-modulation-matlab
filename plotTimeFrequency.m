function [] = plotTimeFrequency(messageTime,name,rows,columns,no,info)
%PLOTTIMEFREQUENCY Summary of this function goes here
%   Detailed explanation goes here
subplot(rows,columns,no);
t = 0:info.SampleRate:info.Duration;
plot(t,messageTime);
title(name , ' in Time Domain');

subplot(rows,columns,no+columns);
plot(real(fft(messageTime)));
title(name , ' in Frequency Domain');

subplot(rows,columns,no+columns*2);
plot(real(fftshift(fft(messageTime))));
title(strcat('Normalized ', name ),' in Frequency Domain');
end

