clear,home
warning off
%% funcao
C = .2;
x = 1:.1:80;
y = C*sin(C*x);
% plot(x,y),return
%%

T = 1;
w = 2*pi/T;

s = 0;
for n = -100:100
    if n == 0
        continue
    end
    Cn = C*(-C*exp(1/2*i*n*w*T)*cos(1/2*C*T)+i*n*w*exp(1/2*i*n*w*T)*sin(1/2*C*T)+C*exp(-1/2*i*n*w*T)*cos(1/2*C*T)+i*n*w*exp(-1/2*i*n*w*T)*sin(1/2*C*T))/(n^2*w^2-C^2);
    sn = 1/T*Cn*exp(i*n*w*x);
    s = s + sn;
end
plot(x,y,x,s),drawnow

erro = norm(y-s)/norm(y);
nit = 1;
while erro > 1e-2 & nit < 1e2
    T = T + (norm(y-s))/norm(y);
    w = 2*pi/T;
    s = 0;
    for n = -1000:1000
        if n == 0
            continue
        end
        Cn = C*(-C*exp(1/2*i*n*w*T)*cos(1/2*C*T)+i*n*w*exp(1/2*i*n*w*T)*sin(1/2*C*T)+C*exp(-1/2*i*n*w*T)*cos(1/2*C*T)+i*n*w*exp(-1/2*i*n*w*T)*sin(1/2*C*T))/(n^2*w^2-C^2);
        sn = 1/T*Cn*exp(i*n*w*x);
        s = s + sn;
    end
    plot(x,y,x,s),drawnow
    erro = norm(y-s)/norm(y);
    nit = nit + 1;
end
tit = ['T = ',num2str(T)];
title(tit)