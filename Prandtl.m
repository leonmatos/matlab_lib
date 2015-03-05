function Pr = Prandtl(p,T)

path(path,'./XSteam_Matlab_v2.6')

k = XSteam('tc_pT',p,T);
cp = 1000*XSteam('cp_pT',p,T);
mu = XSteam('my_pT',p,T);

Pr = cp*mu/k;