function question7(signal,info)
signal=transpose(signal);
fs=info.SampleRate;   % sampling frequency

% SSBSC using butterworth filters 
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

%------------------------------------------------ filter definition

fs=500000; %sampling freq  
N=4283834;  % no of samples
Ts=1/fs;     
n=0:1:(N-1);
t=n*Ts;
k=-N/2:1:N/2-1;
f=(fs/N)*k;
s=1i*2*pi*f;

%ButterWorth BPF

[bt,at]=butter(4,2*pi*2000,'s');
HZFT=(bt(1)*s.^4+bt(2)*s.^3+bt(3)*s.^2+bt(4).*s+bt(5))./(at(1)*s.^4+at(2)*s.^3+at(3)*s.^2+at(4).*s+at(5));
hzft=ifft(ifftshift(HZFT));

fct=98000;
ct=cos(2*pi*fct*t);

hbpf=2*ct.*hzft;
HBPF=fftshift(fft(hbpf));


% filtering signal 
 ssf=sf.*HBPF;
  ss=ifft(ifftshift(ssf));
  ss=real(ss);


%-------------------------------------------------------
% SSBSC demodulation 
 v=ss.*c;
 vf=fftshift(fft(v));
 
 %Butterworth LPF
 [b,a]=butter(4,2*pi*4000,'s');
 HLPF=(b(1)*s.^4+b(2)*s.^3+b(3)*s.^2+b(4).*s+b(5))./(a(1)*s.^4+a(2)*s.^3+a(3)*s.^2+a(4).*s+a(5));
 
 qf=vf.*HLPF;
 q=ifft(ifftshift(qf));
 q=real(q);

 
  qx=resample(q,12,125);
  fs=48000;
  Ts=1/fs;
  N=411249;
  n=0:1:N-1;
  t=n*Ts;
  figure;plot(t,qx);grid on; title('Received SSB-SC Waveform using Coherent Detector (Butterworth)');
  
  k=-N/2:1:N/2-1;
  f=(fs/N)*k;
 qxf=fftshift(fft(qx));
  qxfm=abs(qxf);
  figure;plot(f,qxfm);grid on;title('Received SSB-SC Spectrum using Coherent Detector (Butterworth)');
 
  %sound(qx,fs);  
end