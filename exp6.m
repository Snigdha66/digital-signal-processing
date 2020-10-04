%% EXPERIMENT 6: DTFT, DFT AND DFT SPECTRAL ANALYSIS
% SNIGDHA LABH, 17070123105
%% SOURCE CODE
clc
clear all
close all
%% a.
N=8;
n=0:(N-1);
x=0.7.^n;
for k=1:N
    y(k)=0;
    for n=1:N
        y(k)=(y(k))+((0.7).^(n-1)).*exp((-i*2*pi*(k-1)*(n-1)/N));
    end
end
k=0:(N-1);
magnitude=abs(y);
phaseangle=angle(y);
figure(1)
subplot(2,1,1)
stem(k,magnitude)
grid on
xlabel('k')
ylabel('X[k]')
title('Magnitude plot of 8-point DFT of x[n]')
subplot(2,1,2)
stem(k,phaseangle)
grid on
xlabel('k')
ylabel('X[k] in radians')
title('Phase plot of 8-point DFT of x[n]')
%% b.
N=8;
n=0:(N-1);
x=0.7.^n;
k = 0:(N-1);
Xdft_8 = fft(x,N);
mag=abs(Xdft_8);
pa=angle(Xdft_8);
figure(2)
subplot(2,1,1)
stem(k,mag)
grid on
xlabel('k')
ylabel('X[k]')
title('Magnitude plot of 8-point DFT of x[n] using fft function')
subplot(2,1,2)
stem(k,pa)
grid on
xlabel('k')
ylabel('X[k] in radians')
title('Phase plot of 8-point DFT of x[n] using fft function')
%% c.
N1=16;
n=0:(N1-1);
x=0.7.^n;
k = 0:(N1-1);
Xdft1_8 = fft(x,N1);
mag1=abs(Xdft1_8);
pa1=angle(Xdft1_8);
figure(3)
subplot(2,1,1)
stem(k,mag1)
grid on
xlabel('k')
ylabel('X[k]')
title('Magnitude plot of 16-point DFT of x[n] using fft function')
subplot(2,1,2)
stem(k,pa1)
grid on
xlabel('k')
ylabel('X[k] in radians')
title('Phase plot of 16-point DFT of x[n] using fft function')
% OBSERVATION- Zero-padding means changing the DFT length N without adding
% more signal. By padding zeros, we increase the
% frequency resolution of of the DFT. By appending artificial zeroes(i.e.,
% no additional information is added). We obtain a denser frequency grid
% while applying the DFT.
%% d.
N2=128;
n=0:(N2-1);
x=0.7.^n;
k = 0:(N2-1);
Xdft2_8 = fft(x,N2);
mag2=abs(Xdft2_8);
pa2=angle(Xdft2_8);
figure(4)
subplot(2,1,1)
plot(k,mag2)
grid on
xlabel('k')
ylabel('X[k]')
title('Magnitude plot of 128-point DFT of x[n] using fft function')
subplot(2,1,2)
plot(k,pa2)
grid on
xlabel('k')
ylabel('X[k] in radians')
title('Phase plot of 128-point DFT of x[n] using fft function')
%% e.
% comparison- The relation between digital frequency w and DFT index k can be shown by following equation
% w=2*pi*(k/N)
%% CONCLUSION- 
% In this experiment we computed 8 point, 16 point and 128 point DFT of the
% given signal using the fft function. We sampled the signals over a period
% 2*pi with equally spaced N points. n4=0:5;
Xk=fft(x2);
Yk=fft(y2);
Zk=Xk.*Yk;
Zk=ifft(Zk);
%-------------------------------D------------------------------------
x3 = [-3 5 8 6 2 2 0 0 0];
y3 = [1 1 4 2 0 0 0 0 0];
c3 = cconv(x3,y3,10);
n5 = 0:9;
figure(1);
subplot(311)
stem(n3,h1)
xlabel('n');
ylabel('x*y');
title('Linear convolution of x and y')
subplot(312)
stem(n4,Zk)
xlabel('n');
ylabel('Zk');
title('Response using DFT and DTFT')
subplot(3,1,3)
stem(n5, c3)
xlabel('n');
ylabel('x*y');
title('Circular convolution on padding zeroes')