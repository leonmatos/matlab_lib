clear,home
% Let's consider a Closed Loop (CL) whose tf is G/(1+G*H) = T
M = 100;
c = -1;
k = 10;
%
G = [1];
D = [1 .1 -4];
F = tf(G,D)
hfig = figure(1);
set(hfig, 'Position', [300 80 800 600]);
subplot(2,2,1)
pzmap(F)
subplot(2,2,2)
nyquist(F)

t = 0:.1:10;
f = 20/1601*1601^(1/2)*exp(-1/20*t).*sinh(1/20*t*1601^(1/2));
subplot(2,2,3)
plot(t,f,'g')