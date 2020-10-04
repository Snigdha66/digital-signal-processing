a=[1];
b=[0.5 1 2];
x=[1 0 0 0 0];
n=0:4;
y=filter(b,a,x);
figure(2)
stem(n,y);
