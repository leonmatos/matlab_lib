function [p,k] = getpoint(varargin)

switch nargin
case 0
  h=gca;
case 1
  h=varargin{1};
  axes(h);
otherwise
  disp('Too many input arguments.');
end

% Get current user data
cudata=get(gcf,'UserData'); 
hold on;
% Wait for left mouse button to be pressed
k=waitforbuttonpress;
p1=get(h,'CurrentPoint');       %get starting point
p=p1(1,1:2);                   %extract x and y