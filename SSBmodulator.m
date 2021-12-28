function [Issbsc,ssbsc,ssbtc] = SSBmodulator(m,info,fc)
%AMMODULATOR Summary of this function goes here
%   Detailed explanation goes here

    fs = info.SampleRate;
    %plotSignal(fs,m);          %requiered in the pdf
    
    %filter the signal at fcutoff = 4kHz
    m = lowpass(m,4000,fs);     %Using Ideal Low pass filter but Function is not ready yet
                                %so we use lowpass() temp.
                                
    %sound(m,fs);               %requiered in the pdf

    %resample m
    [p,q] = rat(5.*fc/fs);
    m = resample(m,p,q);
    nfs = fs * p / q;           %nfs --> new sampling rate

    %generate carrier
    t = 0:1/nfs:info.Duration;
    am = max(m);
    ac = am / 0.5;
    c = cos(2*pi*fc*t);

    dsbsc = m'.*c;
    Issbsc = 0;                                                      %temp to return a non null value
    %Issbsc = IdealBandpassFilter(dsbsc,96000,100000,nfs);           %Using Ideal Band pass filter but Function is not ready yet
                                                                    
    %plotSignal(nfs,Issbsc);                                         %requiered in the pdf
    
    ssbsc = ButterBandpassFilter(dsbsc,96000,100000,nfs);
    
    %plotSignal(nfs,Issbsc);                                         %requiered in the pdf
    
    
    
    dsbtc = (ac * ( 1 + 0.5 * m')) .* c;
    ssbtc = 0;
    %ssbtc = IdealBandpassFilter(dsbtc,96000,100000,nfs);          %Using Ideal Band pass filter but Function is not ready yet
    
end

