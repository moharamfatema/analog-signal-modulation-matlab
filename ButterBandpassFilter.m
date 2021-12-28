function y = ButterBandpassFilter(signal,fc1,fc2,Fs)
    Wc=[2*fc1/Fs,2*fc2/Fs];                                                     
    [num,den]=butter(4,Wc);
    y = filter(num,den,signal);   
end