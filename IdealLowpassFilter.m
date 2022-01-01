


x=audioread('eric.wav')';
x=transpose(x);

Fs=48000; %sampling freq  
N=411248;  % no of samples
Ts=1/Fs;     
n=0:1:(N-1);
t=n*Ts;
k=-N/2:1:N/2-1;
f=(Fs/N)*k;

xf=fftshift(fft(x));   %fourier transform of x(t)/X(f)
xfm=abs(xf);           %|X(f)|


Hf=[zeros(1,171354) ones(1,68541) zeros(1,171353)];   %H(f) LPF in freq domain
figure;plot(f,Hf);grid on; title('filter in frequency domain H(f) vs f'); ylim([0 1.2]);


yf=Hf.*xf;        % Y(f)=H(f).X(f)
yfm=abs(yf);      % |Y(f)|
y=ifft(ifftshift(yf));

   

