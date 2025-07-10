M = 0.0287; % Molecular Weight of air
P1 = 100;
T1 = 273+30;
V1 = 0.0038;
r = 8; % Compression Ratio
T3 = 273+1200; % Peak Temperature
k = 1.4; % Gamma of Air
Cv = 0.718; % (kJ/kg-K)
Ru = 8.314;
m = P1*V1*M/(Ru*T1); % mass of air (kg)

% We know that the process 1 --> 2 is adiabatic, so: PV^k is constant and
% we know that the compression ratio r = V1/V2
V2 = V1/r;
P2 = P1*(r^k);
T2 = T1*(r^(k-1));
% The process 2 --> 3 happens at constant volume
V3 = V2;
P3 = P2/T2*T3;
% The process 3 --> 4 is adiabatic
V4 = V1;
P4 = P3*(V3/V4)^k;
T4 = T3*(V3/V4)^(k-1);
hold on;
figure (1)
plot(linspace(V1,V2,1000),linspace(P1,P2,1000));
plot(linspace(V2,V3,1000),linspace(P2,P3,1000));
plot(linspace(V3,V4,1000),linspace(P3,P4,1000));
plot(linspace(V4,V1,1000),linspace(P4,P1,1000));
legend("Isoentropic compression","Constant Volume Heat Addition","Isoentropic expansion","Constant Volume Heat Rejection")
title("P-V graph of Otto Cycle")
xlabel("Volume (m^3)")
ylabel("Pressure (kPa)")
grid on
hold off;

% The thermal efficiency can be calculated using r and k:
n = 1-(1/r^(k-1));
% Heat is rejecetd at a constant volume from 4 --> 1
Q_out = m*Cv*(T4-T1);
Q_in = m*Cv*(T3-T2);
W_net = Q_in-Q_out;
% MEP = W_net/(V1-V2) = W_net/(V1*(1-1/r))
mep = W_net/(V1*(1-1/r));

fprintf("Heat Rejected: %.4f kJ\n",Q_out);
fprintf("Net work output: %.4f kJ\n",W_net);
fprintf("Thermal Efficiency: %.4f kJ\n",n);
fprintf("Mean effective pressure: %.4f kPa\n",mep);