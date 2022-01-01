function [] = plotTimeFrequency(messageTime, info, fs, name,rows,columns,no)

% duration = floor(length(messageTime)/4);
figure
subplot(rows,columns,no);
% messageTime = messageTime(1:duration);
t = 0:1/fs:info.Duration;
% t = t(1:end-1);
if length(t) ~= length(messageTime)
    t = t(1:end-1);
end 
plot(t,messageTime);
title(strcat(name , ' in Time Domain'));

y = abs(fftshift(fft(messageTime)));
f = linspace(-fs/2, fs/2, length(y));

subplot(rows,columns,no+columns);
plot(f, y);
title('Normalized Signal in Frequency Domain');

end

