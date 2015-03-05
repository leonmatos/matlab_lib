clear,home
plot(-8,-4,8,4);hold on
%% getpoint
h=gca;
% Get current user data
cudata=get(gcf,'UserData');
hold on;
% Wait for left mouse button to be pressed
k=waitforbuttonpress;
p1=get(h,'CurrentPoint');       %get starting point
p=p1(1,1:2);                   %extract x and y
set(gcf,'Pointer','arrow');
%%
t = p(1);
x = p(2);
while ~k
    plot(p(1),p(2),'.r')
    if p(1) < t(end)
        plot(p(1),p(2),'.k')
    else
        t = [t;p(1)];
        x = [x;p(2)];
    end
    %% getpoint
    h=gca;
    % Get current user data
    cudata=get(gcf,'UserData');
    hold on;
    % Wait for left mouse button to be pressed
    k=waitforbuttonpress;
    p1=get(h,'CurrentPoint');       %get starting point
    p=p1(1,1:2);                   %extract x and y
    set(gcf,'Pointer','arrow');
    %%
end
hold off

% t = -pi:pi/10:pi;
% x = sin(t);
N = length(x);
w = 2*pi/N;
s = x*0;
c = x*0;

for n = 1:N
    sn = 0;
	for k = 1:N
        ck = 0;
        for m = 1:N
            ck = ck + x(m)*exp(-i*k*w*m);
        end
        sn = sn + ck*exp(i*k*w*n);
        c(k) = 1/N*ck;
    end
    s(n) = 1/N*sn;
end
plot(t,x,'.-r',t,c,'.-')