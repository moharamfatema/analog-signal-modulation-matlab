function plotSignal(Fs,output)                                              %Plots the signal in Timme & Freq domain
    time = linspace(0,length(output)/Fs,length(output));
    mixLen = length(output);
    iFs = 1/Fs;
    mixF0 = 1/(iFs*mixLen);
    f= 0:mixF0: (mixLen-1)*mixF0;
    %f = (0:length(output)-1)*100/length(output);

    figure;
    subplot(2,2,[1 2]);
    plot(time,output);grid;                                                         %Time domain
    title('Signal In Time Domain');
    xlabel('Time (Sec)');
    ylabel('Output');

    subplot(2,2,3);
    foutput = fftshift(fft(output));
    plot(f,abs(foutput));
    title('Magnitude');                                                             %Magnitude
    xlabel('Frequency');
    ylabel('Magnitude');

    subplot(2,2,4);
    plot(f,angle(foutput)*180/pi);                                                  %Phase
    title('Phase');
    xlabel('Frequency');
    ylabel('Phase');
end