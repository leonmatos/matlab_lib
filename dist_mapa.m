function dist = dist_mapa(arquivo,escala)

dist = nan;
if nargin == 1
    errordlg('informe a escala.');
    return
end

im = imread(arquivo);
image(im)

%% definir escalar
title('clique duas vezes para definir escala')
hold on
p = getpoint();
x1 = p(1);
y1 = p(2);
plot(p(1),p(2),'g.')
p = getpoint();
x2 = p(1);
y2 = p(2);
plot(p(1),p(2),'g.')
plot([x1 x2],[y1 y2],'g')
d = sqrt((x1-x2)^2+(y1-y2)^2);
f = escala/d;

%% definir trajetoria
title('clique para definir a trajetoria')
[pini,k] = getpoint();
plot(pini(1),pini(2),'r.');
dist = 0;
while k == 0
    [pfin,k] = getpoint();
    dist = dist+sqrt((pini(1)-pfin(1))^2+(pini(2)-pfin(2))^2);
    plot([pini(1) pfin(1)],[pini(2) pfin(2)],'r');
    plot(pfin(1),pfin(2),'r.');
    pini = pfin;
end
title('terminado')
dist = f*dist;
hold off