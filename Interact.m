% -------------------------------------------------
% A small interative demonstration of Cauchy Argument Principle
% -------------------------------------------------
 
function Interact(Pos,k,w_plane)

% w_plane = zeros(2000,1)*nan;
% k = 0;
if nargin == 0
 
    close all;
    clear all;
    clc;
 
    hfig = figure();
    set(hfig, 'Position', [300 250 1000 400]);
    
    subplot(1, 2, 2);
    title('W-Plane Plot', 'Interpreter', 'None', 'FontSize', 10);
    hold on
    plot(0, 0, '*k', 'MarkerSize', 10, 'LineWidth', 1);
    axis([-1 1 -1 1])
    plot([0 .4], [0 0]);
    
    subplot(1, 2, 1);
    title('S-Plane for s/(s^2+6s+18)', 'Interpreter', 'None', 'FontSize', 10);
    hold on;
    axis([-5 2 -5 5])
    plot(0, 0, 'or', 'MarkerSize', 14, 'LineWidth', 3);
    plot(-3, 3, 'xr', 'MarkerSize', 14, 'LineWidth', 3);
    plot(-3, -3, 'xr', 'MarkerSize', 14, 'LineWidth', 3);
    
    plot([0 1], [0 0]);
    plot([-3 -2], [3 3]);
    plot([-3 -2], [-3 -3]);
    
    global P0 P1 W1
    
    % GCA = Get handle for Current Axis
    P0 = impoint(gca,-2,0);
    setString(P0,'s-point');
 
    % Call subfunction
    DrawPhaser(P0)
    s = -2 + 0*1i;
    val = s/(s^2+6*s+18);
    subplot(1, 2, 2);
    P1 = plot(real(val), imag(val), '.r', 'MarkerSize', 14, 'LineWidth', 2);
    theta5 = atan2(imag(val), real(val));
    if theta5 < 0, theta5 = theta5 + 2*pi; end
    points5 = linspace(0,theta5);
    xCurve5 = (1/5).*cos(points5);  
    yCurve5 = (1/5).*sin(points5); 
    W1 = plot(xCurve5,yCurve5,'-b'); 
 
    % Add callback to each point
    addNewPositionCallback(P0,@Interact);
 
else
 
    global H1 H2 H3 A1 A2 A3 P0 P1 W1% k w_plane
    
    % Important: remove old plots! Otherwise the graph will get messy.
    delete(H1, H2, H3, A1, A2, A3, P1, W1)
    
    DrawPhaser(P0)
    s = Pos(1) + Pos(2)*1i;
    val = s/(s^2+6*s+18);
    
%     k = k+1;
%     w_plane(k) = val;
    
    subplot(1, 2, 2);
%     P1 = plot(real(w_plane),imag(w_plane),'y',real(val), imag(val), '.r',
%     'MarkerSize', 14, 'LineWidth', 2);
    P1 = plot(real(val), imag(val), '.r', 'MarkerSize', 14, 'LineWidth', 2);
    
    theta5 = atan2(imag(val), real(val));
    if theta5 < 0, theta5 = theta5 + 2*pi; end
    points5 = linspace(0,theta5);
    xCurve5 = (1/5).*cos(points5);  
    yCurve5 = (1/5).*sin(points5); 
    W1 = plot(xCurve5,yCurve5,'-b'); 
 
 
end
 
function DrawPhaser(P0)
 
P = zeros(1,2);
P(1,:) = getPosition(P0);
subplot(1, 2, 1);
 
global H1 H2 H3 A1 A2 A3
H1 = arrow([0, 0], [P(:,1) P(:,2)]);
H2 = arrow([-3, 3], [P(:,1) P(:,2)]);
H3 = arrow([-3, -3], [P(:,1) P(:,2)]);
 
theta1 = atan2(P(:,2), P(:,1));
points1 = linspace(0,theta1);
xCurve1 = (1/2).*cos(points1);  
yCurve1 = (1/2).*sin(points1); 
A1 = plot(xCurve1,yCurve1,'-');   
 
theta2 = atan2(P(:,2) +  3, P(:,1) + 3);
points2 = linspace(0,theta2);
xCurve2 = -3 + (1/2).*cos(points2);  
yCurve2 = -3 + (1/2).*sin(points2); 
A2 = plot(xCurve2,yCurve2,'-'); 
 
theta3 = atan2(P(:,2) - 3, P(:,1) + 3);
points3 = linspace(0,theta3);
xCurve3 = -3 + (1/2).*cos(points3);  
yCurve3 =  3 + (1/2).*sin(points3); 
A3 = plot(xCurve3,yCurve3,'-'); 