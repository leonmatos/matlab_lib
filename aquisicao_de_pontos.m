function [X,Y] = aquisicao_de_pontos(imgfile,xi,yi,xf,yf)

disp(' -- executando aquisicao_de_pontos...')

img = imread(imgfile);

disp('    definindo bounding box...')

image(img),hold on
title('clique no limite inferior esquerdo')
p = getpoint();
xmin = p(1);
ymin = p(2);
plot(p(1),p(2),'og')

title('clique no limite superior direito')
p = getpoint();
xmax = p(1);
ymax = p(2);
plot(p(1),p(2),'og')
drawnow

disp('    aquisitando pontos...')
title('clique nos pontos da curva')
[p,k] = getpoint();
x = zeros(100,1)+nan;
y = zeros(100,1)+nan;
i = 1;
while ~k
    x(i) = p(1);
    y(i) = p(2);
    plot(p(1),p(2),'.r',p(1),p(2),'og')
    [p,k] = getpoint();
    i = i+1;
end
hold off
v = find(isnan(x));
x(v) = [];
y(v) = [];

width = xf - xi;
height = yf - yi;
x0 = xi;
y0 = yi;

Y = (y-ymin)/(ymax-ymin)*(height)+y0;
X = (x-xmin)/(xmax-xmin)*(width)+x0;

plot(X,Y,'-or'),grid on
disp(' -- concluido')