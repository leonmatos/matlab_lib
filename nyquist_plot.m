clear,home
w = 0:.1:20;
r = w*nan;
m = w*nan;
figure(1)
for k = 1:length(w)
    r(k) = -2/(4+w(k)^2);
    m(k) = -w(k)/(4+w(k)^2);
    plot(r,m,'or',0,-.5)
    title(['angle (deg) = ',num2str(180/pi*atan(m(k)/r(k)))]),drawnow
    if r(k) == -m(k)
        fprintf('w(-45) = %1.4f\n',w(k)/2/pi)
    end
end
hold on
N = [1 2];
D = [1 0 -4];
nyquist(N,D),hold off