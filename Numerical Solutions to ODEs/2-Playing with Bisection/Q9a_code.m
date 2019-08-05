% Start Problem 9, using bisection.m
% (a) Sketch graphs of y = x and y = 2sin(x)
% for clarity, we use an interval from -4*pi to 4*pi, spacing 0.01
x = [-4*pi:0.01:4*pi];
y1 = 2 * sin(x);
y2 = x;

plot(x,y1,x,y2,'.-'),xlabel('x'), ylabel('y')
title('Overlaid Graphs of y1 and y2'),legend('2sin(x)', 'x')
grid on, axis equal

% Through the plot, we see that x = 2sin(x) occurs exactly at x = 0
% In the command window, we just need to type in Q9a_code and it will run
% this graph