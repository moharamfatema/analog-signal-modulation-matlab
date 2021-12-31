function [] = FMreceiver(nbfm,info,fc)

fs = info.SampleRate;
fs_new = 5*fc;

dim = diff(nbfm);
ED = abs(hilbert(dim));
m_rec = 0.1*(ED - abs(mean (ED)));
mfm = resample(m_rec,fs,fs_new);
t = linspace(0,length(mfm)/fs,length(mfm));

figure
plot(t,mfm);
title("Signal received from NBFM");

end

