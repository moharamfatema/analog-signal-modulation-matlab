function question3(m,info)
m=transpose(m);
fs=info.SampleRate;   % sampling frequency
N=411248;    %no of samples
Ts=1/fs;        
t=0:Ts:(N-1)*Ts;

xf=fftshift(fft(m));  %fourier transform of signal x(t)

Hf=[zeros(1,171354) ones(1,68541) zeros(1,171353)]; %H(f) LPF in freq domain
yf=Hf.*xf; % Y(f)=H(f).X(f)

y=ifft(ifftshift(yf)); % inverse fourier transform to obtain y(t)
figure;plot(t,y);
grid on;
title('Audio Waveform after filtering');
%sound(y,fs);
end