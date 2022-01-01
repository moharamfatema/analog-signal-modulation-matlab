   function y = IdealLowpassFilter(signal,fc,Fs)
hlp = (fc/pi) * sinc (fc*n/pi);

Hlp = zeros(size(Fs));

Hlp(-wc<=w & <= wc) = 1;
    

   
end

