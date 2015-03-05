% This script reads the sample.wav audio file and generates the frequency
% spectrum of the audio signal.
% You can generate a controlled audio (with known frequencies) from
% http://www.audionotch.com/app/tune/ (at least it was possible on
% 02-July-2014). Don't forget to insert to total time interval of the
% signal to obtain the correct frequency range.
clear,home
y = wavread('sample.wav'); % signal
%% some filtering
v = find(y < 4e4);
y(v) = 0;
%%
tmax = 6; % time (s)
fmax = 6000;
n = length(y);
t = linspace(0,tmax,n);
figure(2)
subplot(1,2,1)
plot(t,y)
xlabel('time (s)')
ylabel('amplitude')
Y = fft(y)/n;
N = n/2;
f = [1:N]/tmax;
Y = abs(Y(1:N))*2;
v = find(f <= fmax);
f = f(v);
Y = Y(v);
subplot(1,2,2)
plot(f,Y,'r');
xlabel('frequency (Hz)')
ylabel('amplitude')