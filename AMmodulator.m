function [dsbsc,dsbtc] = AMmodulator(m,info,fc)
%AMMODULATOR Summary of this function goes here
%   Detailed explanation goes here
    fs = info.SampleRate;
    %filter the signal at fcutoff = 4kHz
    m = lowpass(m,4000,fs);
    %sound(m,fs);

    %resample m
    [p,q] = rat(5.*fc/fs);
    m = resample(m,p,q);
    fs = fs * p / q;

    %generate carrier
    t = 0:1/fs:info.Duration;
    am = max(m);
    ac = am / 0.5;
    c = cos(2*pi*fc*t);

    dsbsc = m'.*c;
    dsbtc = (ac * ( 1 + 0.5 * m')) .* c;

end

