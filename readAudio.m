function [signalTime,signalFrequency,signalFrequencyShifted,fs] = readAudio(filename)
%READANDPLOTAUDIO Summary of this function goes here
%   Detailed explanation goes here
[signalTime,fs] = audioread(filename);
signalFrequency = fft(signalTime);
signalFrequencyShifted = fftshift(signalFrequency);
end

