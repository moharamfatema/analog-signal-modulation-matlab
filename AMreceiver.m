function [msc,mtc] = AMreceiver(dsbsc,dsbtc,info,fc)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

t = 0:1/info.SampleRate:info.Duration;

msc = abs(hilbert(dsbsc));
mtc = abs(hilbert(dsbtc));
mtc = mtc - abs(mean (mtc));

% [p , q] = rat(info.SampleRate / (5*fc));
msc = resample(msc,info.SampleRate,5*fc);
mtc = resample(mtc,info.SampleRate,5*fc);
mtc = LowPassFilter(mtc',info.SampleRate, 4000);
msc = LowPassFilter(msc',info.SampleRate, 4000);

%plotting in time domain


% f = figure('Name','Amplitude Demodulation');
% subplot(2,1,1);
% plot(t,msc);
% title('DSB-SC with envelope detector');
% 
% subplot(2,1,2);
% plot(t,mtc);
% title('DSB-TC with envelope detector');
% 
% sgtitle('Amplitude Demodulation');
% c = cos(2*pi*fc*t);
% msc = msc.*c;
%amplify and filter
% msc = 10000.*lowpass(msc,4000,info.SampleRate);

%plotTimeFrequency(msc,"DSBSC coherent",1,1,1,info);
end

