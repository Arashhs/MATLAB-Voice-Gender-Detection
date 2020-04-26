function peakFreq = getPeak(address)
[data,Fs] = audioread(address);
data = transpose(data);
dataLength = length(data);

signalPower = abs(fft(data)/dataLength).^2;
signalPower = signalPower(1:length(data)/2+1)/length(data);
hz = linspace(0,Fs/2,floor(dataLength/2)+1);

[pks,frqs] = findpeaks(signalPower,hz);

index = find(pks == max(pks));
peakFreq = frqs(index); % frequency at which pks is maximum
fprintf('Peak Frequency for file %s is %f\n',address,peakFreq);
end

