% Given that y1(x) = 2x+1 and y2(x) = 2x/(1+0.2x)
% dy1 = 2dx => Adjusting limits => ll = (0-1)/2 = -0.5 ; ul = (15-1)/2 = 7

% Thus first integral changes to following function f1
% f1 = @(x) 2./(2.*x+1+2.*x./(1+0.2.*x));
% Thus second integral changes to following function f2
f2 = @(x) 2./(2.*x+1-2.*x./(1+0.2.*x));
% fprintf("First Inetgral: %lf",integral(f1,-0.5,7));
fprintf("Second Integral: %.4f\n",integral(f2, -0.5, 7));