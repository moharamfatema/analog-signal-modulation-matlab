function y = lowpass(m,fc,fs)
    Wp = (2*pi*fc)/fs;                                                                                                             % Passband Frequency (Normalised)
    Ws = Wp+0.1;                                                       
    Rp =  1;                                                            
    Rs = 60;                                                            
    [n,Wp] = ellipord(Wp,Ws,Rp,Rs);                                     
    [z,p,k] = ellip(n,Rp,Rs,Wp,'low');                                   
    [sos,g] = zp2sos(z,p,k);                                                                                          
    y = filtfilt(sos, g, m);
end