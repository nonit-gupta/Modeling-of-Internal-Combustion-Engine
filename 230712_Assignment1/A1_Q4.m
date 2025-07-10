y = @(x) [x(2)-2*x(1)/(1+x(1)); (x(2)-1)/x(1) - 2/(1+x(1))^2];
initial = [1;1];
point = fsolve(y,initial);
% The other known point is A(0,1) and thus we can find the slope:
m = (point(2)-1)/point(1);
l = 0:0.1:5;
c1 = 2.*l./(1+l);
c2 = m.*l+1;
plot(l,c1,l,c2);
legend('Curve','Tangent')