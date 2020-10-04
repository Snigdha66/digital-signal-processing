%% 1. Write a Matlab program to design an FIR filter with
%
% a. 10 – taps
% b. 25 – taps
% Cut off frequency is ?/4. Use Rectangular window.
% Plot the magnitude
%% a
w=pi/4;
N=10;
a=(N-1)/2;
Wr=rectwin(N);
for n=0:N-1
    if(n~=a)
        hd(n+1)=sin((n-a)*w)/(pi*(n-a));
else
hd(n+1)=w/pi;
    end
end
hr=hd.*Wr';
[h1,w1]=freqz(hr);
plot(w1,abs(h1));
%% 2. Write a Matlab program to design a 40-tap FIR filter with
% a. Rectangular window
% b. Hamming window
% Cut off frequency is ?/3. Plot the magnitude response in both cases on
% the same graph and comment.
%% a
w=pi/4;
N=40;
a=(N-1)/2;
Wr=rectwin(N);
for n=0:N-1
    if(n~=a)
        hd(n+1)=sin((n-a)*w)/(pi*(n-a));
else
hd(n+1)=w/pi;
    end
end
hr=hd.*Wr';
figure(2);
[h1,w1]=freqz(hr);
plot(w1,abs(h1));
%% b
Wh=hamming(N);
for n=0:N-1
if(n~=a)
hd(n+1)=sin((n-a)*w)/(pi*(n-a));
else
hd(n+1)=w/pi;
end
end
hh=hd.*Wh';
[h2,w2]=freqz(hh);
hold on;
plot(w2,abs(h2));
xlabel('w')
ylabel('|H(w)|');
title('magnitude response of fir filter');
legend('rectwin','hamming');
%% 3. Write a Matlab program to determine and sketch the response of a system 
% represented by its impulse response sequence h(n) =  [1,1,1,1],
% to an input x(n) =  [1,1,1,1].
%%  