function draw_spring_mass_damper(y0)

sx = [0 0 -.2 .2 -.2 .2 -.2 .2 -.2 .2 -.2 .2 0 0];
sy = [0 1];
sy = [sy sy(end)+.2];
sy = [sy sy(end)+.4];
sy = [sy sy(end)+.4];
sy = [sy sy(end)+.4];
sy = [sy sy(end)+.4];
sy = [sy sy(end)+.4];
sy = [sy sy(end)+.4];
sy = [sy sy(end)+.4];
sy = [sy sy(end)+.4];
sy = [sy sy(end)+.4];
sy = [sy sy(end)+.2];
sy = [sy sy(end)+1];
s_height = sy(end);
s_width = (max(sx)-min(sx))/2;
sy = y0/s_height*sy;

mx = [0 0 1 1 0];
my = [0 1 1 0 0];
mx = mx - s_width;
my = my + y0;

plot(sx,sy,mx,my)