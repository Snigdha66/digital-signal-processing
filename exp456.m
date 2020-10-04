%% 4. Two systems denoted by h1(n) = [3 -1 -2 0 0] and
% h2(n) = [0 0 0 3 1] are connected in series. Write a Matlab
% program to input the two sequences, determine the impulse response of
% the resultant system and determine and sketch the response of the system
% to an input a^n u(n) for 0?n?4. Choose |a|<1.
a=0.5;
n=0:4;
n1=0:1:8;
x=a.^n;
h1=[3 -1 -2 0 0];
h2=[0 0 0 3 1];
h=conv(h1,h2);
y=conv(x,h);
figure(1);
subplot(311)
stem(n,x);
subplot(312)
stem(n1,h);
subplot(313)
stem(0:length(y)-1,y);
%% 5. Two systems denoted by h1(n) = [3 -1 -2 0 0] and
% h2(n) =[0 0 0 3 1] are connected in parallel. Write a Matlab
% programme to determine and sketch the response of the system to an
% input x(n)=cos(n)
n=0:1:2;
n1=0:1:4;
x=cos(n);
h1=[3 -1 -2 0 0];
h2=[0 0 0 3 1];
h=h1+h2;
y1=conv(x,h);
figure(2);
subplot(311)
stem(n,x);
subplot(312)
stem(n1,h);
subplot(313)
stem(0:length(y1)-1,y1);
%% 6. Write a Matlab programme to determine the N=4 point
% DFT of a sequence x(n)=[0,1,2,3]. Sketch the
% magnitude and phase of the resultant DFT sequence.
N=4;
k=0:N-1;
x=[0 1 2 3];
xdft=fft(x,N)
mag=abs(xdft);
phase=angle(xdft);
figure(3)
subplot(211);
stem(k,mag);
subplot(212)
stem(k,phase)

%% 10. Write a Matlab program to obtain the z-transform of the input sequence
% x(n) = {3,0,0,0,0,6,1,-4} and to obtain the inverse z-
% transform given the z-transform H(z) = _______________________.
%x= [3 0 0 0 0 6 1 -4];
syms n;
x= 3 + 0*(n) + 0*(n^2) + 0*(n^3) + 0*(n^4) + 0*(n^5) + 6*(n^6) + 1*(n^7) + (-4)*(n^8);
ztrans(x)
%% 11. Write a Matlab program to sample the signal
% x(t) = ________________________ at an appropriate sampling
% frequency to be able to reconstruct the signal from its samples. Plot both
% x(t) and the sequence x(n) on the same graph.
f1=50;
f2=100;
f3=150;
fm=f3;
tf=0.04;
t=0:0.0001:0.04;
x= cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t);
figure(4)
subplot(211)
plot(t,x)
fs=2700;
n=0:tf*fs;
x1= cos(2*pi*f1*(n/fs))+cos(2*pi*f2*(n/fs))+cos(2*pi*f3*(n/fs));
subplot(212)
stem(n,x1)
%% 20. Consider the following difference equation y(n) = ay(n-1) + x(n)
% Write a Matlab function diffeqn(a,x,y1) which will compute the value of
% the output y(n) of the system defined by the above equation. Assuming
% a=1 and y1= y(-1)=0 use the function to determine and plot the output
% sequence y(n), over 30 samples, for an input x(n) = ?(n).
n=0:29;
x=[1 zeros(1,29)]
a=[1 -1];
b=[1];
y=filter(b,a,x);
figure(5)
stem(n,y)
