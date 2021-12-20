clear;
close all;
clc;

[m, fs] = audioread('eric.wav');
f = figure('Name','Amplitude modulation');
f.WindowState = 'fullscreen';
subplot(3,3,1);
name = 'Original message signal';
plotTimeFrequency(m,name,3,3,1);
%filter the signal at fcutoff = 4kHz
m = lowpass(m,4000,fs);
%sound(m,fs);
info = audioinfo('eric.wav');

%resample m
fc = 100000;
[p,q] = rat(5.*fc/fs);
m = resample(m,p,q);
fs = fs * p / q;

%generate carrier
t = 0:1/fs:info.Duration;
am = max(m);
ac = am / 0.5;
c = cos(2*pi*fc*t);

dsbsc = m'.*c;
name = ('DSB-SC modulated signal');
plotTimeFrequency(dsbsc,name,3,3,2);

dsbtc = (ac * ( 1 + 0.5 * m')) .* c;
name = ('DSB-TC modulated signal');
plotTimeFrequency(dsbtc,name,3,3,3);

clc;