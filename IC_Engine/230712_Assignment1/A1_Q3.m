y = @(x) [x(1)^2 + x(2)^2 - 4;
        x(1)^2 - x(2) - 1];
initial = [1; 1];
soln = fsolve(y,initial);
fprintf('The point is (%.4f,%.4f)\n',soln(1),soln(2));