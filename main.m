clear;
close all;
clc;

[m, fs] = audioread('eric.wav');
info = audioinfo('eric.wav');
fc = 100000;
t = 0:1/info.SampleRate:info.Duration;

%-----------------------------------PART 1-----------------------------------
%[dsbsc,dsbtc] = AMmodulator(m,info,fc);
%plotNineTimeFrequency(m,dsbsc,dsbtc,info,'Amplitude Modulation','Original message signal','DSB-SC modulated signal','DSB-TC modulated signal');

%[msc, mtc] = AMreceiver(dsbsc,dsbtc,info,fc);

%sound(msc,fs);
%pause(info.Duration);
%sound(2.*mtc,fs);
%----------------------------------------------------------------------------


%-----------------------------------PART 2-----------------------------------
[Issbsc,ssbsc,ssbtc] = SSBmodulator(m,info,fc);
[mIsc,msc,mtc] = SSBreceiver(Issbsc,ssbsc,ssbtc,info,fc);

%sound(mIsc,fs);             %requiered in the pdf
%sound(msc,fs);              %requiered in the pdf
%plotSignal(fs,mIsc);        %requiered in the pdf
%plotSignal(fs,msc);         %requiered in the pdf

ssbN1 = awgn(mIsc,0);        %received signal from SSB modulation + noise 1
ssbN2 = awgn(mIsc,10);       %received signal from SSB modulation + noise 2
ssbN3 = awgn(mIsc,30);       %received signal from SSB modulation + noise 3

%sound(ssbN1,fs);              %requiered in the pdf
%sound(ssbN2,fs);              %requiered in the pdf
%sound(ssbN3,fs);              %requiered in the pdf
%plotSignal(fs,ssbN1);         %requiered in the pdf
%plotSignal(fs,ssbN2);         %requiered in the pdf
%plotSignal(fs,ssbN3);         %requiered in the pdf

%sound(mtc,fs);              %requiered in the pdf
%plotSignal(fs,mtc);         %requiered in the pdf
%----------------------------------------------------------------------------

%-----------------------------------PART 3-----------------------------------
%TO-DO
%----------------------------------------------------------------------------


clc;