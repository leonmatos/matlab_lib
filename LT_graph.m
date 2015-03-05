clear,home
n = 1000;
fmax = 1.1;
tmax = n/fmax;
t = linspace(0,tmax,n);
f1 = .8; A1 = 1;
f2 = .2; A2 = 2;
y = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t);
figure(1)
subplot(2,2,1)
plot(t,y)
% take the Fourier Transform
T = tmax;
w = linspace(0,fmax,n);
for k = 1:n
    b = w(k);
    A = A1;
    f = f1;
    Y1 = -1/2/pi*A*(-f+f*exp(-2*i*pi*b*T)*cos(2*pi*f*T)+i*b*exp(-2*i*pi*b*T)*sin(2*pi*f*T))/(-b^2+f^2);
    A = A2;
    f = f2;
    Y2 = -1/2/pi*A*(-f+f*exp(-2*i*pi*b*T)*cos(2*pi*f*T)+i*b*exp(-2*i*pi*b*T)*sin(2*pi*f*T))/(-b^2+f^2);
    Y(k) = Y1 + Y2;
end
f = linspace(0,fmax,n);
subplot(2,2,2)
plot(w,abs(Y)*2/tmax)

Y = fft(y)/n;
subplot(2,2,4)
plot(f,abs(Y)*2,'r')