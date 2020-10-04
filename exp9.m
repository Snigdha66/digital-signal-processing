%% EXPERIMENT 09: Design and implementation of FIR filter to meet given specifications.
%%
% NAME: SANJANA MUNDHARIKAR
% PRN: 17070123087
% BATCH:EB2
%% SOURCE CODE
clc; clear all; close all;
w=pi/2;
N=25;
a=(N-1)/2;
Wr=rectwin(N);
Wh=hamming(N);
for n=0:N-1
if(n~=a)
hd(n+1)=sin((n-a)*w)/(pi*(n-a));
else
hd(n+1)=w/pi;
end
end
hr=hd.*Wr';
hh=hd.*Wh';
[h1,w1]=freqz(hr);
[h2,w2]=freqz(hh);
plot(w1,abs(h1));
hold on;
plot(w2,abs(h2));
xlabel('w')
ylabel('|H(w)|');
title('magnitude response of fir filter');
legend('rectwin','hamming');
%% CONCLUSION-
% Steps to design FIR filter
%
% 1. calculate hd(w).
%
% 2. calculate hd(n) from hd(w) by taking IFT from given cutoff frequency.
%
% 3. multiply hd(n) with w(n) to get h(n).
%
% 4. calculate H(z) and realise the filter
% 
% FIR filter has been designed using Hamming window function and Rectangular
% window. Window function is simple in operation and provides greater flexibility in digital signal
% processing applications. 
% FIR filter design by using Hamming window is better as it is stable as
% compared to Rectangular window technique and ripples in pass band are less in hamming as compared
% to Rectangular window.
