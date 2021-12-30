function c = generateSignal(info, fs, fc, phaseshift)

t = 0:1/fs:info.Duration;
c = cos(2*pi*fc*t + phaseshift);

end