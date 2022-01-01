clear;
close all;
clc;

[m, fs] = audioread('eric.wav');
info = audioinfo('eric.wav');
fc = 100000;

plotTimeFrequency(m, info, fs, " Message Signal", 2, 1, 1)
% % sound(m, fs);


%-----------------------------------PART 1-----------------------------------
[dsbsc,dsbtc] = AMmodulator(m,info,fc);
% plotNineTimeFrequency(m,dsbsc,dsbtc,'Amplitude Modulation','Original message signal','DSB-SC modulated signal','DSB-TC modulated signal');
plotTimeFrequency(dsbsc, info, 5*fc, " DSB-SC", 2, 1, 1)
plotTimeFrequency(dsbtc, info, 5*fc, " DSB-TC", 2, 1, 1)

[msc, mtc] = AMreceiver(dsbsc,dsbtc,info,fc);
plotTimeFrequency(msc, info, fs, " Received signal from DSB-SC", 2, 1, 1)
sound(msc,fs);

plotTimeFrequency(mtc, info, fs, " Received signal from DSB-TC", 2, 1, 1)
sound(2.*mtc,fs);

% pause(info.Duration);

% Coherent detection of DSB-SC with no noise
demodSig = coherentDetector(dsbsc, info, fc, 0);
plotTimeFrequency(demodSig, info, fs, " Coherent detection of DSB-SC with no noise", 2, 1, 1)
% sound(demodSig, fs);

%Coherent detection of DSB-SC with SNR = 0dB
noisySig1 = awgn(dsbsc, 0, 'measured', 'dB');
demodSig = coherentDetector(noisySig1, info, fc, 0);
plotTimeFrequency(demodSig, info, fs, " Coherent detection of DSB-SC with SNR = 0dB", 2, 1, 1)
% sound(demodSig, fs);

%Coherent detection of DSB-SC with SNR = 10dB
noisySig2 = awgn(dsbsc, 10, 'measured', 'dB');
demodSig = coherentDetector(noisySig2, info, fc, 0);
plotTimeFrequency(demodSig, info, fs, " Coherent detection of DSB-SC with SNR = 10dB", 2, 1, 1)
% % sound(demodSig, fs);

%Coherent detection of DSB-SC with SNR = 30dB
noisySig3 = awgn(dsbsc, 30, 'measured', 'dB');
demodSig = coherentDetector(noisySig3, info, fc, 0);
plotTimeFrequency(demodSig, info, fs, " Coherent detection of DSB-SC with SNR = 30dB", 2, 1, 1)
% sound(demodSig, fs);

%NOTE: % sound starts to be clear starting from 70dB

%Coherent detection of DSB-SC with frequency error, fc = 100.1KHz
demodSig = coherentDetector(dsbsc, info, 100.1 * 10^3, 0);
plotTimeFrequency(demodSig, info, fs, " Coherent detection of DSB-SC with frequency error, fc = 100.1KHz", 2, 1, 1)
% % sound(demodSig, fs);

%Coherent detection of DSB-SC with phase error = 20 degrees
demodSig = coherentDetector(dsbsc, info, fc, 20 * pi / 180);
plotTimeFrequency(demodSig, info, fs, " Coherent detection of DSB-SC with phase error = 20 degrees", 2, 1, 1)
% % sound(demodSig, fs);

%----------------------------------------------------------------------------

%-----------------------------------PART 2-----------------------------------
question1(m,info);
question2(info);
question3(m,info);
question4(m);
question5(m);
question6(m,info);
question7(m,info);
question8(m,info);
question9(m,info);
%----------------------------------------------------------------------------

%-----------------------------------PART 3-----------------------------------
nbfm = FMmodulator(m,info,fc);
plotTimeFrequency(nbfm, info, 5*fc, " NBFM", 2, 1, 1);

mfm = FMreceiver(nbfm,info,fc);
plotTimeFrequency(mfm, info, fs, " Received from NBFM", 2, 1, 1);
sound(mfm, fs);

%----------------------------------------------------------------------------


clc;
