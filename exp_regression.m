function [c,x,y,R] = exp_regression(x,y,do_plot)

if nargin < 3
    do_plot = 1;
elseif strcmp(do_plot,'no_plot')
    do_plot = 0;
else
    fprintf('exp_regression: third input argument is wrong\n')
    c = nan;
    x = nan;
    y = nan;
    R = nan;
    return
end

if nargin < 2
    x = []; y = [];
    plot(0,0,1,1),hold on
    [p,k] = getpoint();
    while ~k
        plot(p(1),p(2),'.r');
        x = [x;p(1)];
        y = [y;p(2)];
        [p,k] = getpoint();
    end
else
    if size(x,1) == 1
        x = x';
    end
    if size(y,1) == 1
        y = y';
    end
    if do_plot
        plot(x,y,'.r'),hold on
    end
end

y = log(y);
degree = 1;
X = zeros(length(x),degree+1);
for i = 1:degree+1
    X(:,i) = x.^(degree-i+1);
end
A = X'*X;
b = X'*y;

c = inv(A)*b;

%% coefficient of determination
yi = polyval(c,x);
Sig_e = sum((yi-y).^2);
Sig_r = sum((yi-mean(y)).^2);
R = Sig_r/(Sig_r + Sig_e);
fprintf('coefficient of determination = %4.8f\n',R)
%%
c(2) = exp(c(2));

%% plot do fitting
if length(x) < 10
    dx = (max(x) - min(x)) / 10;
    xi = min(x):dx:max(x);
else
    xi = x;
end
yi = c(2)*exp(c(1)*xi);
if do_plot
    plot(xi,yi),hold off
end