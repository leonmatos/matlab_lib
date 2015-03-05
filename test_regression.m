clear, home
% [c,xf,yf,R] = linear_regression(3);

X = [45	4.1787709
52	4.1800263
60	4.1827665
70	4.1880980
80	4.1955185];

x = X(:,1);
y = X(:,2);

% [c,xf,yf,R] = exp_regression(x,y);
[c,xf,yf,R] = linear_regression(x,y,2);