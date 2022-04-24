f1 = 3000;
f2 = 5000;
f3 = 7000;
fs = 100000;

Ts = (1 / fs);
t = 0 : Ts : 10 / min(f1,f2,f3);

sig_1 = sin(2 * pi * f1 * t);
sig_2 = sin(2 * pi * f2 * t);
sig_3 = sin(2 * pi * f3 * t);
sig = sig_1 + sig_2 + sig_3;

figure(1)
subplot(211);
plot(t,sig);
title("time domain for signal");

sig_fft = abs(fft(sig));
k = [0 : length(t)-1] * fs / length(t);

subplot(212);
plot(k, sig_fft);
title("frequency domain for signal");


