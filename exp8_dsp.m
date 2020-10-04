%% EXPERIMENT 08: Digital Signal Processing using Simulink
% SNIGDHA LABH, 17070123105
%% SOURCE CODE
clc; close all;
%% Q3 & 4
load handel.mat
stem(handel.mat)
% t=0:length(y)-1;
% xx=[t',y];
% g=awgn(y,20);
% xx1=[t',g];
%% Q5
n=0:19;
x=4.^n;
y=((6/5).*4.^n)+((26/25).*4.^n)-((1/25).*(-1).^n);
xx=[n',x'];
yy=[n',y'];
stem(0:length(yy)-1,yy);
figure();
stem(0:length(y)-1,y);
%% conclusion- 