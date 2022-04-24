f = 2000 : 5000;
fs = 10 * max(f);

Ts = 1/fs;
t = 0 : Ts : 10/min(f);

y = zeros(length(f), length(t));

for i = 1 : length(f)
  y(i,:) = sin(2 * pi * t .*f (1,i));
end

subplot(2,4,1)
plot(t,y(1,:));
title("Time domain for f = 2000");

subplot(2,4,2)
plot(t,y(2000,:));
title("Time domain for f = 4000");

y_sum = zeros(1, length(t));

for k = 1 : length(f)
  y_sum += y(k,:);
end

y_add = y(1,:) + y(2000,:);

subplot(2,4,3)
plot(t,y_add);
title("Time domain for f = 4000 and f = 2000");

subplot(2,4,4)
plot(t,y_sum);
title("Time domain for combined sig for f = 2000 ~ f = 4000");

% fft starts

y_2000 = fft(y(1,:));
y_4000 = fft(y(2000,:));
y_added = fft((y_add));
y_combined = fft(y_sum);
N = length(t);
x = (0 : N-1) * fs / N;

subplot(2,4,5)
plot(x,abs(y_2000)/N);
title("freqeuncy domain f = 2000");

subplot(2,4,6)
plot(x,abs(y_4000)/N);
title("freqeuncy domain f = 4000");

subplot(2,4,7)
plot(x,abs(y_added)/N);
title("Frequency domain for f = 2000 and f = 4000");

subplot(2,4,8)
plot(x,abs(y_combined)/N);
title("Frequency domain for combined signal for f = 2000 ~ f = 4000");




