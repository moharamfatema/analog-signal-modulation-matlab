function demodSig = coherentDetector(dsbsc, info, fc, phaseshift)
fs = info.SampleRate;
%resample dsb-sc
%     [p,q] = rat(fs / (5*100 * 10^3));
      dsbsc = resample(dsbsc, fs,5 * 100 * 10 ^ 3);
%     dsbsc = resample(dsbsc,p,q);

%generate s(t) 
s = generateSignal(info, fs, fc, phaseshift);

%r(t)*s(t)
demodSig = dsbsc.*s;

%lowpass filter to remove higher frequency term
demodSig = 10000.*IdealLowpassFilter(demodSig', fs, 4000);

end