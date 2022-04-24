f1 = 3000;
f2 = 5000;
f3 = 7000;
fs = 100000;

n = 0 : (1/fs) : 10/ min(f1,f2,f3);

y1 = sin(2 * pi * f1 * n);
y2 = sin(2 * pi * f2 * n);
y3 = sin(2 * pi * f3 * n);

y_sum = y1 + y2 + y3;

% filter design using window

N = -172 : 172;

h = 0.08 * sinc(0.08 * N);
w = hamming(length(N));
H = h .* w';

figure(1)
freqz(H,1);

result = conv(y_sum, H);

% showing filtering result 

figure(2)

subplot(221)
plot(n,y_sum)
title("time domain for original signal");

k1 = (0 : length(n)-1) * fs / length(n);

subplot(223)
plot(k1, abs(fft(y_sum)));
title("frequency domain for original signal");

subplot(222)
plot(result);
title("time domain for filtered signal");

k2 = [0 : length(result)-1] * fs / length(result);
subplot(224)
plot(k2, abs(fft(result)));
title("frequency domain for filtered signal");



