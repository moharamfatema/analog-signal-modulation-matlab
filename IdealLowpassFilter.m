function m = IdealLowpassFilter(m, fs, fcutoff)
f = linspace(-fs/2,fs/2,length(fftshift(fft(m)/fs))); % frequency axis
mf = fftshift(fft(m));
aux = abs(f') < fcutoff;
mf = mf .* aux;
m = real(ifft(ifftshift(mf)));         
end

