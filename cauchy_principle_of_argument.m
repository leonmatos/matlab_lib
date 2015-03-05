clear,home
path('./Doutorado/matlab_lib/',path)
figure(1)
hold off
plot(0,0)
figure(2)
hold off
plot(0,0)

N = [0 1 -1];
D = [1 2 -4 -64];

zeroes = roots(N);
poles = roots(D);

hfig2 = figure(2);
set(hfig2, 'Position', [600 250 400 400]);
hfig1 = figure(1);
set(hfig1, 'Position', [150 250 400 400]);
plot(real(zeroes),imag(zeroes),'o',real(poles),imag(poles),'+r'),grid on
hold on
[p,k] = getpoint();
G = [];
while k == 0
    sigma = p(1); % real part of the point in s-plane
    w = p(2);     % imaginary part of the point in s-plane
    plot(sigma,w,'.g')
    G = [G;polyval(N,sigma+w*i)/polyval(D,sigma+w*i)];
    figure(2)
    hold on
    plot(real(G),imag(G),'.-k'),grid on
    figure(1)
    [p,k] = getpoint();
end
figure(2)
nyquist(N,D)