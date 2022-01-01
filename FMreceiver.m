function [mfm] = FMreceiver(nbfm,info,fc)

fs = info.SampleRate;
fnew = 5*fc;

dim = diff(nbfm);
mnbfm = abs(hilbert(dim));
mreceived = 0.1*(mnbfm - abs(mean (mnbfm)));
mfm = resample(mreceived,fs,fnew);
% t = linspace(0,length(mfm)/fs,length(mfm));

% figure
% plot(t,mfm);
% title("Signal received from NBFM");

end

