clear,home
n = 100;
A = zeros(n,1);
for i = 1:n
    A(i) = monte_carlo(10000);
end
media = mean(A); % media
variancia = mean((A-media).^2); % variancia
sigma = sqrt(variancia); % desvio padrao

fprintf('media: %2.4f\ndesvio padrao: %2.4f\n\n',media,sigma)