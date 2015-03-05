clear,home
% So let's think about a damped harmonic system, modelled by
% M*d2x/dt2 + c*dx/dt + k*x = f(t)

% The Laplace transform of the equation above is:
% (M*s2 + c*s + k)*X(s) = F(s)

% Then, x(t) is obtained from the inverse of the Laplace transform
M = 100;
c = -1;
k = 10;
%% delta impulse
% Introducing a single impulse (delta function), we get f(t) = delta; whose
% Laplace transform F(s) = 1;
% H(s) = 1/(M*s2 + c*s + k)

% Solution of the 2nd order ODE:
% It can be seen that x(t) can be calculated from the inverse of the
% Laplace transform (that is, the inverse of H(s)*F(s)). And moreover, we
% can calculate this inverse using the Convolution Theorem, which says that
% the inverse of a Laplace transform of a product H(s)*F(s) is equal to the
% convolution between h(t) and f(t).
% The convolution between h(t) and f(t) is also a function of t and is
% given by the integration of h(t-u)*f(u)*du from 0 to t.

% To find out the inverse Laplace transform of H(s) we can write H(s) as a
% product of two functions H(s) = A(s)*B(s), where A(s) = 1/(s-r1) and B(s)
% = 1/(s-r2), and r1 and r2 are the roots of M*s2+c*s+k.
% For F(s), we know that its inverse Laplace transform is f(t) = delta
% function.

% The inverse Laplace transform of A(s) and B(s) are a(t) = exp(r1*t) and
% b(t) = exp(r2*t). Now we have to convolve a(t) with b(t), which lead us
% to h(t) = (exp(r2*t)-exp(r1*t))/(r2-r1). The roots r1 and r2 are:
% r1 = (-c + sqrt(c2 - 4*M*k))/(2*M)
% r2 = (-c - sqrt(c2 - 4*M*k))/(2*M)

% Now, convolving h(t) with f(t), we get... h(t)! (because f(t) is the
% delta function, which makes integration quite straight forward.

% So, in the end, we have that:
% x(t) = h(t) = (exp(r2*t)-exp(r1*t))/(r2-r1), where
r1 = (-c + sqrt(c^2 - 4*M*k))/(2*M);
r2 = (-c - sqrt(c^2 - 4*M*k))/(2*M);
% Now let's plot it!

t = 0:.1:200;
x = (exp(r2*t)-exp(r1*t))/(r2-r1);
hfig = figure(1);
set(hfig, 'Position', [300 250 1000 400]);
subplot(1,2,1)
plot(t,x),xlabel('time'),ylabel('position')
subplot(1,2,2)
nyquist([1],[M c k]);
hold on
plot(real([r1;r2]),imag([r1;r2]),'xg')
hold off

%% step function
% Introducing a step function, we get f(t) = 1; whose
% Laplace transform F(s) = 1/s;
% H(s) = 1/(M*s2 + c*s + k)
% nyquist([1],[M c k 0]);