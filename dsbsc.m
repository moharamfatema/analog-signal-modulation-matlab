clear;
clc;
[m, mf, mfshift, fs] = readAudio('eric.wav');
plotFrequency(mf,mfshift,fs);
f = linspace(0,size(mf,1),fs);
figure;
plot(f,real(fft(lowpass(m,4000,fs))));

clc;