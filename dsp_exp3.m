%% EXP 3- SAMPLING AND ALIASING
%
% Snigdha Labh, 17070123105
%
%% SOURCE CODE
clc
clear all
close all
%% Question 1:
f1=50;
f2=100;
f3=150;
Fm=f3;
tf=0.04;
t=0:0.0001:tf;
x= cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t);
figure(1);
subplot(2,2,1);
plot(t,x);
xlabel('t');
ylabel('x');
title('original signal');

% for Fs<2Fm
Fs1=250;
n1=0:tf*Fs1;
x1=cos(2*pi*f1*(n1/Fs1))+cos(2*pi*f2*(n1/Fs1))+cos(2*pi*f3*(n1/Fs1));
subplot(2,2,2)
stem(n1,x1);
hold on
plot(n1,x1);
xlabel('n');
ylabel('x1');
title('signal when Fs<2Fm');

% for Fs=Fm
Fs2=300;
n2=0:tf*Fs2;
x2=cos(2*pi*f1*(n2/Fs2))+cos(2*pi*f2*(n2/Fs2))+cos(2*pi*f3*(n2/Fs2));
subplot(2,2,3)
stem(n2,x2);
hold on;
plot(n2,x2)
xlabel('n');
ylabel('x2');
title('signal when Fs=2Fm');

% for Fs>2Fm
Fs3=2700;
n3=0:tf*Fs3;
x3=cos(2*pi*f1*(n3/Fs3))+cos(2*pi*f2*(n3/Fs3))+cos(2*pi*f3*(n3/Fs3));
subplot(2,2,4)
stem(n3,x3);
hold on;
plot(n3,x3);
xlabel('n');
ylabel('x3');
title('when Fs>2Fm');

%% Observation
%
% Sampling frequency should be atleast equal to twice 
% of Maximum Frequency to eliminate aliasing(this is called nyquist rate).
% So when Fs>2Fm , there is no aliasing and it is almost same as original frequency 
% and when Fs=2Fm,we get smooth
% curve, no aliasing. When Fs<2Fm, there is aliasing.
% 
% In case- Fs=2Fm, F_fold=Fs/2=125, F3'=F3-Fs=150
%% Question 2:
BB=[];
A=440;
j=0;
for i=-9:3
    j=j+1;
B=2^(i/12);
AA=440*B;
BB=[BB round(AA)];
end
C=BB(1);
D=BB(3);
E=BB(5);
F=BB(6);
G=BB(8);
B=BB(12);
CC=BB(13);
freq=[C D E F G B A CC];
freq_str=['C' 'D' 'E' 'F' 'G' 'B' 'A' 'CC'];
% period=ceil((1./freq)*1000000);
% tone=ceil(period/2.5);
freq_max=max(freq);
Fs1=8000;
Ts=1/Fs1;
t=0:Ts:0.5;
r=0;
for i=1:length(freq)
s = (i)*sin(2*pi*freq(i)*t);
sound(s);
pause(0.5);
N=length(s);
c = fft(s)/N;            
y=fftshift(c);
p = abs(y);         
f = (-N/2:1:N/2-1)*Fs1/N;    
if (i<=8)
figure(2);
subplot(8,2,i*2-1);
plot(t(1:50),s(1:50));
xlabel('Time');
ylabel('Amplitude');
title(['Time domain signal of' ' ' freq_str(i) '=' num2str(freq(i)) ' ' 'Hz']);
subplot(8,2,i*2);
plot(f,p);
axis([-1000 1000 0 max(p)]);
xlabel('Frequency');
ylabel('Magnitude');
title('Frequency domain analysis');
else
r=r+1;
subplot(4,2,r*2-1);
plot(t(1:100),s(1:100));
xlabel('Time');
ylabel('Amplitude');
title(['Time domain signal of' ' ' freq_str(i) '=' num2str(freq(i)) ' ' 'Hz']);
subplot(4,2,r*2);
plot(f,p);
axis([-1000 1000 0 max(p)]);
xlabel('Frequency');
ylabel('Magnitude');
title('Frequency domain analysis');
end 
end
%% Observation:
%
% There was no aliasing when Fs=8000 samples/sec.  When Fs is taken as 600, Folding
% Frequency lies between -300 and 300(-Fs/2<F<Fs/2), beyond these values we
% observe aliasing. New aliased frequency F', F'=|F-Fs|,and these values are verified from the
% plot.
% when Fs=600  F'= 330-600=270 , F'= 349-600=270 , F'= 392-600=270 
%
% F'= 494-600=270, F'= 440-600=270, F'= 523-600=270
pause(1)
EE=[C C G G A A G F F E E D D C G G F F E E D G G F F E E D];
figure;

for k=1:length(EE)
s2 = 2*sin(2*pi*EE(k)*t);
sound(s2)
pause(0.5)
if (mod(k,7)==0)
    pause(0.3)
end
N2=length(s2);
c2 = fft(s2)/N2;            
y2=fftshift(c2);
p2 = abs(y2);         
f2 = (-N2/2:1:N2/2-1)*Fs1/N2;  
subplot(211)
plot(f2,p2)
axis([-1000 1000 0 1])
hold on
xlabel('Frequency');
ylabel('Magnitude');
title('Frequency domain analysis');
figure(3)
subplot(212)
plot(t(1:50),s2(1:50))
hold on
xlabel('Time');
ylabel('Amplitude');
title('Time domain signal');
end

%% new song
FF=[D A G A F G A F   G A G F E D E D C];
figure(3);

for k=1:length(FF)
s2 = 2*sin(2*pi*FF(k)*t);
sound(s2)
pause(0.5)
if (mod(k,7)==0)
    pause(0.3)
end
N2=length(s2);
c2 = fft(s2)/N2;            
y2=fftshift(c2);
p2 = abs(y2);         
f2 = (-N2/2:1:N2/2-1)*Fs1/N2;  
figure(4)
subplot(211)
plot(f2,p2)
axis([-1000 1000 0 1])
hold on
xlabel('Frequency');
ylabel('Magnitude');
title('Frequency domain analysis');
subplot(212)
plot(t(1:50),s2(1:50))
hold on
xlabel('Time');
ylabel('Amplitude');
title('Time domain signal');
end
%% Conclusion:
%
% In this experiment we observed that Aliasing is when a continuous-time 
% sinusoid appears as a discrete-time sinusoid with multiple frequencies. 
% The sampling theorem establishes conditions(Fs>2Fm)that prevent aliasing 
% so that a continuous-time signal can be uniquely reconstructed from its samples.
% In these two experiment we obtained aliased frequencies and verified them
% theoretical values