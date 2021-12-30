function [] = plotTimeFrequency(messageTime,name,rows,columns,no)

duration = floor(length(messageTime)/4);
figure
subplot(rows,columns,no);
messageTime = messageTime(1:duration);
t = 0:duration - 1;
plot(t,messageTime);
title(strcat(name , ' in Time Domain'));

f = abs(fftshift(fft(messageTime)));

subplot(rows,columns,no+columns);
plot(f);
title('Normalized Signal in Frequency Domain');

end

