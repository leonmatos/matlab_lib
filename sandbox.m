%% sandbox

% In this script I'm visualizing the difference between 1/(s-a), which
% is commonly presented as the Laplace transform of f(t) = exp(a*t), 
% and the numerical value of the integration process for the Laplace
% transform of this function. This difference is actually due to the
% existence of a convengence region where 1/(s-a) is valid.
clear,home
a = 2;
n = 1e16;
s = -10:.01:10;
L = -1./(s-a).*exp(a-s)*n;
figure(1)
plot(s,L,s,1./(a-s))
xlabel('s')
ylabel('L')
return