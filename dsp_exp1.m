%% EXP 1
%
% Snigdha Labh, 17070123105
%
%% SOURCE CODE
clc
clear all
close all
%% question 1:
nx=[-3:1:7];
x=[0 0 0 2 0 1 -1 3 0 0 0];
subplot(3,2,1)
stem(nx,x);
title('discrete time sequence x')
ylabel('x');
xlabel('nx');
%% question 2
nx1=nx+2;
y1=x;
subplot(3,2,2);
stem(nx1,y1);
title('discrete time signal y1')
ylabel('y1');
xlabel('ny1');
%2
nx2=nx-1;
y2=x;
subplot(3,2,3);
stem(nx2,y2);
title('discrete time signal y2')
ylabel('y2');
xlabel('ny2');
%3
nx3=nx*(-1);
y3=x;
subplot(3,2,4);
stem(nx3,y3);
title('discrete time signal y3')
ylabel('y3');
xlabel('ny3');
%4
nx4=nx3+1;
y4=x;
subplot(3,2,5);
stem(nx4,y4);
title('discrete time signal y4')
ylabel('y4');
xlabel('ny4');
%% question 3
%
% y1 signal is delayed by 2.
%
% y2 is advanced by 1.
% 
% y3 is flipped.
%
% y4 is flipped and advanced by 1.
%% CONCLUSION
%
% In this experiment we plotted Discrete Time sequence x by using stem
% function and then plotted vectors y1, y2 ,y3, y4 and did operations- shifting, folding and compared how these
% signals are related to original signal x. And we obtained desired result.