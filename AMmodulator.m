function [dsbsc,dsbtc] = AMmodulator(m,info,fc)

fs = info.SampleRate;
%filter the signal at fcutoff = 4kHz
m = LowPassFilter(m, fs, 4000);

% sound(m,fs);
plotTimeFrequency(m, info, fs, "filtered message", 2, 1, 1);

%resample m
% [p,q] = rat(5.*fc/fs);
m = resample(m,5*fc,fs);
% fs = f * p / q;
fs  = 5*fc;

%generate carrier
c = generateSignal(info, fs, fc, 0);
am = max(m);
ac = am / 0.5;

dsbsc = m'.*c;
dsbtc = (ac * ( 1 + 0.5 * m')) .* c;

end

