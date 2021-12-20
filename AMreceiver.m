function [msc,mtc] = AMreceiver(dsbsc,dsbtc,info,fc)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

msc = abs(hilbert(dsbsc));
mtc = abs(hilbert(dsbtc));

[p , q] = rat(info.SampleRate / (5*fc));
msc = resample(msc,p,q);
mtc = resample(mtc,p,q);

%plotting in time domain
t = 0:info.SampleRate:info.Duration;

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

end

