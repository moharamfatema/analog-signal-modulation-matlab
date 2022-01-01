function nbfm = FMmodulator(m,info,fc)

fs = info.SampleRate;
fsnew = 5*fc;

mnew = resample(m',fsnew,fs);
msum = cumsum(mnew);
t = linspace(0,length(msum)/fsnew,length(msum));
Kf = 73.1; % (kf*max(msum)/(2*pi*fm) << 1)
nbfm = cos(2*pi*fc*t + Kf*msum);
% nbfm_mod = fftshift(fft(nbfm)/fsnew);
% f = linspace(-fsnew/2,fsnew/2,length(nbfm_mod));

% figure
% plot(f,nbfm_mod);
% title("NBFM in frequency domain");

end

