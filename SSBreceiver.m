function [mIsc,msc,mtc] = SSBreceiver(Issbsc,ssbsc,ssbtc,info,fc)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
sampleRate = info.SampleRate;

t = 0:1/sampleRate:info.Duration;

[p , q] = rat(sampleRate / (5*fc));
Issbsc = resample(Issbsc,p,q);
ssbsc = resample(ssbsc,p,q);
ssbtc = resample(ssbtc,p,q);


c = cos(2*pi*fc*t);
mIsc = Issbsc.*c;                                    
msc = ssbsc.*c;

%amplify and filter (Coherent Detection)
mIsc = 100000.*lowpass(mIsc,4000,sampleRate);              %we must use Ideal Low Pass Filter but the function is not ready
                                                           %so we use lowpass() temp.
msc = 100000.*lowpass(msc,4000,sampleRate);                %we must use Ideal Low Pass Filter but the function is not ready
                                                           %so we use lowpass() temp.


%Envelope Detection
mtc = abs(hilbert(ssbtc));
mtc = lowpass(mtc,4000,sampleRate);                        %we must use Ideal Low Pass Filter but the function is not ready
                                                           %so we use lowpass() temp.
end

