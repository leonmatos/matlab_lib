function xnext = next_complex_point(d,beta,u0,x,A,B)

xIend = imag(x);
xRend = real(x);

u0R = u0(1);
u0I = u0(2);

C = B*d*norm(u0)*cos(A*beta);
a = -u0I/u0R;
b = u0I/u0R*xIend + xRend + C/u0R;

c1 = a^2 + 1;
c2 = 2*a*b - 2*a*xRend - 2*xIend;
c3 = -(B*d)^2 + b^2 - 2*b*xRend + xRend^2 + xIend^2;

r = roots([c1 c2 c3]);

xI = r(1);
xR = a*xI + b;
xnext = [xR xI];