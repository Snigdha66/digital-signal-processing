%% EXPERIMENT 10: Design and implementation of IIR filter to meet given specifications.
%%
% NAME: SANJANA MUNDHARIKAR
% PRN: 17070123087
% BATCH:EB2
%% SOURCE CODE
clc
clear all
close all
T=1;
Wp=0.2*pi;
Ws=0.6*pi;
As=0.2;
Ap=0.8;
Op=(2/T)*tan(Wp/2)
Os=(2/T)*tan(Ws/2)
N=round(0.5*log(1/0.2^2/1/0.8^2-1)/log(0.2/0.2*pi))
w=0.75;
[b,a]=butter(N,w,'s')
tf(b,a)
[num,den]=bilinear(b,a,1)
tf(num,den,1)
freqz(num,den)
%% CONCLUSION
% A) steps to design IIR filter- 
%
% 1. Given specifications of analog filter, obtain specification of digital
% filter.
%
% 2. Obtain specification of equivalent analog filter-for blt   =
%
% 3. Obtain order of filter
%
% 4. Determine cutoff frequency
%
% 5. Determine Ha(s)
%
% 6. calculate H(z) as - BLT-> s=
%
%
% B) a MATLAB command to calculate order and cutoff frequency of Butterworth filter- 
%
% [n,Wn] = buttord(Wp,Ws,Rp,Rs,'s') finds the minimum order n and cutoff frequencies Wn for an analog Butterworth filter.
%
% C) The cut-off frequency of the designed IIR filter satisfies stop band.
