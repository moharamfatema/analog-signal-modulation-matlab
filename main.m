clear;
close all;
clc;

[m, fs] = audioread('eric.wav');
info = audioinfo('eric.wav');
fc = 100000;

[dsbsc,dsbtc] = AMmodulator(m,info,fc);
%plotNineTimeFrequency(m,dsbsc,dsbtc,info,'Amplitude Modulation','Original message signal','DSB-SC modulated signal','DSB-TC modulated signal');

[msc, mtc] = AMreceiver(dsbsc,dsbtc,info,fc);



%sound(msc,fs);
%sound(mtc,fs);


clc;
