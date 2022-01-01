function question1(m,info)
m=transpose(m);
fs=info.SampleRate;   % sampling frequency
N=411248;    %no of samples
Ts=1/fs;        
t=0:Ts:(N-1)*Ts;

k=-N/2:1:N/2-1;    
f=(fs/N)*k;
xf=fftshift(fft(m));  %fourier transform of signal x(t)
xfm=abs(xf);          %magn of fourier transform

plot(t,m); %time domain plot / x(t) vs t
grid on;
title('Audio Waveform');

figure;plot(f,xfm); %freq domain plot  /|X(f)| vs f
grid on;
title('Audio Spectrum');
end