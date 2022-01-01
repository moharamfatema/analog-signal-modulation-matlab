function question2(info)
fs=info.SampleRate;   % sampling frequency
N=411248;    %no of samples

k=-N/2:1:N/2-1;    
f=(fs/N)*k;

Hf=[zeros(1,171354) ones(1,68541) zeros(1,171353)]; %H(f) LPF in freq domain
figure;plot(f,Hf); % H(f) vs f
grid on;
title('Ideal Lowpass Filter H(f)');
ylim([0 1.2]);
end