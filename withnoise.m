function withnoise(signal,info,noise)


% SSBSC with noise
SNRDB=noise;

signal=transpose(signal);

fs=info.SampleRate; %sampling freq  
N=411248;  % no of samples
Ts=1/fs;     
n=0:1:(N-1);
t=n*Ts;
k=-N/2:1:N/2-1;
f=(fs/N)*k;

xf=fftshift(fft(signal));   %fourier transform of x(t)/X(f)



Hf=[zeros(1,171354) ones(1,68541) zeros(1,171353)];   %H(f) LPF in freq domain



yf=Hf.*xf;        % Y(f)=H(f).X(f)
y=ifft(ifftshift(yf));

m=y;
%---------------------------------------------------------------
%SSBSC modulation

m=resample(m,125,12);   % going to new sampling frequency
fs=500000;               % new sampling freq 500K
N=length(m);           % New no of samples
Ts=1/fs;

n=0:1:N-1;      % our new parametres at new sampling frequency
k=-N/2:1:N/2-1;
t=n*Ts;
f=(fs/N)*k;

fc=100000;   % carrier frequency
c=cos(2*pi*fc*t);  %c(t)

s=m.*c;
sf=fftshift(fft(s));


% filter definition

B=4000;   %signal bandwidth%

KB=ceil((N/fs)*(fc-B));
KC=ceil((N/fs)*fc);

HBPf=[zeros(1,N/2-KC) ones(1,KC-KB+1) zeros(1,2*KB-1) ones(1,KC-KB+1) zeros(1,N/2-KC-1)];


% filtering signal 
ssf=sf.*HBPf;
ssfm=abs(ssf);
ss=ifft(ifftshift(ssf));

%-------------------------------------------------------
% SSBSC demodulation 
r=awgn(ss,SNRDB);
v=r.*c;
vf=fftshift(fft(v));

HLPf=[zeros(1,2107647) ones(1,68541) zeros(1,2107646)];

qf=vf.*HLPf;
q=ifft(ifftshift(qf));

qx=resample(q,12,125);
fs=48000;
Ts=1/fs;
N=411249;
n=0:1:N-1;
t=n*Ts;
figure;plot(t,qx);grid on; title(strcat('Received SSB-SC waveform + noise (db) = ',num2str(noise)));

k=-N/2:1:N/2-1;
f=(fs/N)*k;
qxf=fftshift(fft(qx));
qxfm=abs(qxf);
figure;plot(f,qxfm);grid on;title(strcat('Received SSB-SC Spectrum + noise (db) = ',num2str(noise)));

%sound(qx,fs);   
end