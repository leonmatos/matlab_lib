function alpha = angle_3_complex_numbers(x)

u0 = [real(x(end)-x(end-1)) imag(x(end)-x(end-1))];
u1 = [real(x(end-1)-x(end-2)) imag(x(end-1)-x(end-2))];
cross_prod = cross([u0 0],[u1 0]);
alpha = sign(cross_prod(3))*acos(u0*u1'/(norm(u0)*norm(u1)));