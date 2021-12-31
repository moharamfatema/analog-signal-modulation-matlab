function nbfm = FMmodulator(m,info,fc)

fs = info.SampleRate;
fs_new = 5*fc;

m = m';
y_res = resample(m,fs_new,fs);
y_sum = cumsum(y_res);
t = linspace(0,length(y_sum)/fs_new,length(y_sum));
Kf = 73.1;
nbfm = cos(2*pi*fc*t + Kf*y_sum);
nbfm_mod = fftshift(fft(nbfm)/fs_new);
f = linspace(-fs_new/2,fs_new/2,length(nbfm_mod));

figure
plot(f,nbfm_mod);
title("NBFM in frequency domain");

end

