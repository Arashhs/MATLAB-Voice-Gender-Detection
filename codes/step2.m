[y,Fs] = audioread("voices\\v9.mp3");
data = transpose(y);
dataLength = length(data);
soundTime = dataLength/Fs;
time = (0:dataLength-1)/Fs;

signalPower = abs(fft(data)/dataLength).^2;
hz = linspace(0,Fs/2,floor(dataLength/2)+1);

subplot(2,1,1);
plot(time, data);
xlabel('Time (s)'), ylabel('Amplitude')
title('Time domain')

subplot(2,1,2);
stem(hz, signalPower(1:length(hz)));
xlabel('Frequency (Hz)'), ylabel('Power');
title('Frequency domain');
set(gca,'XLim',[0 1000]);


