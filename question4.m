function question4(signal)
signal=transpose(signal);
xf=fftshift(fft(signal)); %fourier transform of x(t)/X(f)
Hf=[zeros(1,171354) ones(1,68541) zeros(1,171353)]; %H(f) LPF in freq domain
yf=Hf.*xf; % Y(f)=H(f).X(f)
y=ifft(ifftshift(yf)); % inverse fourier transform to obtain y(t)
% tasks 1 2 3 4
m=y;
m=resample(m,125,12); % going to new sampling frequency
fs=500000; % new sampling freq 500K
N=length(m); % New no of samples
Ts=1/fs;
n=0:1:N-1; % our new parametres at new sampling frequency
k=-N/2:1:N/2-1;
t=n*Ts;
f=(fs/N)*k;
fc=100000; % carrier frequency
c=cos(2*pi*fc*t); %c(t)
s=m.*c; % s(t) in DSBSC
% fourier transform

sf=fftshift(fft(s));
figure;plot(t,s);grid on;title('DSB-SC Waveform'); %modulated sig in time
sfm=abs(sf);
figure;plot(f,sfm);grid on;title('DSB-SC Spectrum'); %modulated sig in freq
end