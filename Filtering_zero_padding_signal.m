clear all;

img_org = imread('hello.jpg');
img_gray = rgb2gray(img_org);

#kernel design - Identity filter
k = [0,0,0;0,1,0;0,0,0]
img_Identity = conv2(img_gray, k);

#Wavelet Transform
img_wavelet = fwt2(img_Identity, 'db8',4);
figure(1)
subplot(211)
imagesc(dynlimit(20*log10(abs(img_wavelet)), 70))
title("Wavelet Tramsformed");

subplot(212)
img_wavelet(200:430, 300:642) = 0;
imagesc(dynlimit(20*log10(abs(img_wavelet)), 70))
title("Wavelet zero-padding");

#Wavelet- inverse
figure(2)
subplot(211)
imshow(img_Identity,[])
title("Original Image");
rev_img_wavelet = ifwt2(img_wavelet, 'db8',4);
subplot(212)
imshow(rev_img_wavelet,[])
title("wavelet restored");

#FFT
figure(3)
img_fft = fft2(img_Identity);
img_fft(200:430, 300:642) = 0;

rev_img_fft = ifft2(img_fft);

subplot(211)
imshow(img_Identity,[])
title("Original Image");
subplot(212)
imshow(rev_img_fft,[])
title("FFT restored")







