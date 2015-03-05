function A = monte_carlo(n)

x1 = 0;
x2 = pi;
dx = (x2-x1)/n;
x = x1:dx:x2;
f = x.*sin(x);
fmax = max(f);
a = fmax*(x2-x1)/n;
A_exata = sin(x2)-x2*cos(x2) - (sin(x1)-x1*cos(x1));

A = 0;
for i = 1:n
    xi = (x2-x1)*rand()+x1;
    fa = fmax*rand();
    fi = xi*sin(xi);
    if fa <= fi
        A = A + a;
    end
end

fprintf('Area aproximada: %2.4f\n',A)
fprintf('Area exata: %2.4f\n\n',A_exata)

% plot(x,f)