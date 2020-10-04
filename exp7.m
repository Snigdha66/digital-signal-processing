%% 7
x=[1 1 1 1];
h=[1 1 1 1];
Xk=fft(x);
Hk=fft(h);
Zk=Xk.*Hk
Z=ifft(Zk)
figure(1)
stem(0:length(Z)-1,Z)
%% 13
a=[1];
b=[0.5 1 2];
x1=[1 0 0 0 0];
n=0:4;
y=filter(b,a,x1);
figure(2)
stem(n,y);
x2=[1 1 1 1 1 1 1 1 1 1]
n1=0:9;
y1=filter (b,a,x2)
figure(3)
stem(n1,y1)
