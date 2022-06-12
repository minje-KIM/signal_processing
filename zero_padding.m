# insert signal 
f = 3000000;
fs = 30000000;

n = 0 : (1/fs) : 10/f;

y1 = sin(2 * pi * f * n);

figure(1)
subplot(231);
stem(y1);
title("original signal in time domain ");

y2 = zeros(1, length(y1) * 2);
y2(1:2:end) = y1;

subplot(234);
stem(y2)
title("zero padding signal in time domain ");

k1 = [0: length(y1)-1]* fs / length(y1);
subplot(232)
plot(k1, abs(fft(y1)));
title("original signal in frequency domain ");


k2 = [0: length(y2)-1]* fs / length(y2);
subplot(235)
plot(k2, abs(fft(y2)));
title("zero padding signal in frequency domain ");


N = -83 : 83;

h = 0.333 * sinc(0.333 * N);
w = hamming(length(N));
H = h .* w';

%figure(2)
%freqz(H,1);

subplot(233)



result = conv(y2, H);
k3 = [0 : length(result)-1] * (fs) / length(result);

subplot(233)
stem(result);
title("filtered zero padding signal in time domain");

subplot(236)
plot(k3, abs(fft(result)));
title("filtered zero padding signal in frequency domain");

%y2 = zeros(1,length(x)*2);
%y2(1:2:end) = x;
%stem(y2)



