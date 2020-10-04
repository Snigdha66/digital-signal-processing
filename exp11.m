%% EXPERIMENT 11: Implementation of I/D sampling rate converter.
%%
% NAME: RHEA MUKHERJEE
% PRN: 17070123064
% BATCH:EB1
%% SOURCE CODE
clc;clear all;close all;
disp('Length of input signal=30'); 
N=30;
disp('Frequency of sinusoid=0.05'); 
f=0.05;
n=0:N-1;
x=sin(2*pi*f*n);
%% Interpolation by factor I=2
disp('*** Interpolation by factor I=2 ***');
disp('Interpolation factor=2');  
I=2;
xi=upsample(x,I);
xii=interp(x,I);
figure('name','Interpolation by factor I=2','NumberTitle','off');
subplot(311);
stem(n,x);
xlabel('n');
ylabel('x(n)');
title('Original Signal');
subplot(312);
stem(0:N*I-1,xi);
xlabel('n');
ylabel('xi(n)');
title('Signal after Upsampling');
subplot(313);
stem(0:N*I-1,xii);
xlabel('n');
ylabel('xii(n)');
title('Signal after Intepolation');
%% Decimation by factor D=3
disp('*** Decimation by factor D=3 ***');
disp('Decimation factor=3'); 
D=3;
xd=downsample(x,D);
xdd=decimate(x,D,3,'fir');
figure('name','Decimation by factor D=3','NumberTitle','off');
subplot(311);
stem(n,x);
xlabel('n');
ylabel('x(n)');
title('Original Signal');
subplot(312);
stem(0:N/D-1,xd);
xlabel('n');
ylabel('xd(n)');
title('Signal after Downsampling');
subplot(313);
stem(0:N/D-1,xdd);
xlabel('n');
ylabel('xdd(n)');
title('Signal after Decimation');
%% Multirate by non-integer factor I/D=3/4=0.75
disp('*** Multirate by non-integer factor I/D=3/4=0.75 ***');
disp('Interpolation factor=3'); 
I=3;
disp('Decimation factor=4'); 
D=4;
xi=interp(x,I);
xid=decimate(xi,D,3,'fir');
figure('name','Multirate by non-integer factor I/D=3/4','NumberTitle','off');
subplot(311);
stem(n,x);
xlabel('n');
ylabel('x(n)');
title('Original Signal');
subplot(312);
stem(0:N*I-1,xi);
xlabel('n');
ylabel('xi(n)');
title('Signal after Interpolation');
subplot(313);
stem(0:round(N*I/D-1),xid);
xlabel('n');
ylabel('xid(n)');
title('Signal after Decimation');
%% conclusion- 
%
% We first upsampled and interpolated the signals by using command upsample and interp. 
% Then downsampled and decimated the filter by using command downsample and
% decimate and plotted the graph.
% Filter combined with upsampling is interpolator and filter combined with
% downsampling is decimator. interpolator is anti-imaging filter and
% decimator is anti-aliasing filter. 