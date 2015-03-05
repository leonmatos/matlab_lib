function water_density()

path(path,'./XSteam_Matlab_v2.6')

p = 1:10:500;
T = 10:20:800;
r = zeros(length(p),length(T));

for i = 1:length(p)
    for j = 1:length(T)
        r(i,j) = XSteam('rho_pT',p(i),T(j));
    end
end

[p,T] = meshgrid(p,T);

surf(p,T,r')
xlabel('p (bar)')
ylabel('T (^oC)')
zlabel('\rho (kg/m^3)')