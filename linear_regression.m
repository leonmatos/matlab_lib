function [c,x,y,R2] = linear_regression(x,y,degree,coef_lin)

if nargin == 2
    coef_lin = y;
end
if nargin <= 2
    degree = x;
    x = []; y = [];
    plot(-1,-1,1,1),hold on
    [p,k] = getpoint();
    while ~k
        plot(p(1),p(2),'.r');
        x = [x;p(1)]; %#ok<AGROW>
        y = [y;p(2)]; %#ok<AGROW>
        [p,k] = getpoint();
    end
else
%     plot(x,y,'.r'),hold on
end

if size(x,1) == 1
    x = x';
end
if size(y,1) == 1
    y = y';
end

X = zeros(length(x),degree+1);
for i = 1:degree+1
    X(:,i) = x.^(degree-i+1);
end
A = X'*X;
b = X'*y;
if nargin == 2 || nargin == 4
    A(end,:) = 0;
    A(:,end) = 0;
    A(end,end) = 1;
    b(end) = coef_lin;
end
c = inv(A)*b;

%% plot do fitting
% if nargin <= 2
    if length(x) < 10
        dx = (max(x) - min(x)) / 10;
        xi = min(x):dx:max(x);
    else
        xi = x;
    end
    yi = polyval(c,xi);
    plot(x,y,'.r',xi,yi),hold off
% end
%% coefficient of determination
yi = polyval(c,x);
Sig_e = sum((yi-y).^2);
Sig_r = sum((yi-mean(y)).^2);
R2 = Sig_r/(Sig_r + Sig_e);
fprintf('coefficient of determination = %4.8f\n',R2)
%%