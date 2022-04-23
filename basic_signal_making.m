%Edit 함수를 통해 .m 파일 생성한 후, 
%주파수가 1K인 코사인 그래프 생성 및 출력

f = 1000;
T = 1/ f;
t = 0 : 0.001 * T : 1*T;
y = cos(2 * pi * f * t);

plot(t,y);
grid on;
title("cosine graph for f = 1K");
