clear,home
path('./Doutorado/matlab_lib/',path)

hfig2 = figure(2);
set(hfig2, 'Position', [600 250 400 400]);
hfig1 = figure(1);
set(hfig1, 'Position', [150 250 400 400]);
[p,k] = getpoint();
x = [];
while k == 0
    x = [x;p(1)+p(2)*1i];
    plot(0,0,'ob',real(x),imag(x),'.-g'),grid on
    y = x.^2+6*x+50;
    figure(2)
    plot(0,0,'or',real(y),imag(y),'.-k'),grid on
    figure(1)
    [p,k] = getpoint();
    if norm(y(end)) < 1e-2
        k = 1;
    end
	title(x(end))
end