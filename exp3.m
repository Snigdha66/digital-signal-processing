%% 21. Write a Matlab program to sketch the pole-zero plot, the impulse
% response and the frequency response of a system described by the transfer
% function H(z) = ___________________________.
n=[1 0];
d=[1 -0.25 -0.375];
htf=tf(n,d,1)
figure(1)
zplane(n,d);
%% 9. An LTI system is described by the difference equation: y[n]=0.5x[n]+x[n-1]+2x[n-2];
% Write a Matlab programme to
% a. Define the coefficient vectors a and b
% b. Construct the transfer function of the system using the coefficien vectors
% c. Obtain the pole-zero plot of the system.
a=[1];
b=[0.5 1 2];
g=tf(a,b,1);
figure(2)
zplane(a,b)
%% 22. Write a Matlab programme to design an N=  order digital
% Butterworth IIR filter with cutoff frequency . Plot its
% magnitude response.
n=1;
Wn=0.75;
[b,a] = butter(n,Wn,'s')
tf(b,a)
[num,den]=bilinear(b,a,1);
tf(num,den,1)
figure(3)
% mag?
%% 14. Given a sequence x(n) = _________________ for 0?n?99. Determine
% the first 50 samples of the upsampled sequence x(n/I) for i=3. Plot the
% first 20 samples of the upsampled sequence.
N=50;
n=0:49;
I=3;
f=0.05;
x=sin(2*pi*f*n);
xi=upsample(x,I);
figure(4)
subplot(311);
stem(n,x);
subplot(312)
stem(0:N*I-1,xi);