function [dsbsc,dsbtc] = AMmodulator(m,info,fc)

fs = info.SampleRate;
%filter the signal at fcutoff = 4kHz
m = lowpass(m,4000,fs);
sound(m,fs);

%resample m
[p,q] = rat(5.*fc/fs);
m = resample(m,p,q);
fs = fs * p / q;

%generate carrier
c = generateSignal(info, fs, fc, 0);
am = max(m);
ac = am / 0.5;

dsbsc = m'.*c;
dsbtc = (ac * ( 1 + 0.5 * m')) .* c;

end

