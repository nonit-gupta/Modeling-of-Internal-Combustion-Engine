R = 8.314*10^-2;
Cv = 1.5*R;
Cp = 2.5*R;
k = Cp/Cv;
% Since the first process is an adiabatic process, hence we can use the
% relation PT^(k/(1-k)) = const and find the pressure at the end of the
% first process
P1 = 1;
T1 = 273+70;
T2 = 273+150;
P2 = P1*(T1/T2)^(k/(1-k));
P3 = P2;
T3 = 273+70;
% Applying ideal gas equation to obtain specific volume at first stage:
v1 = R*T1/P1;
% Using the property of adiabatic process, Pv^k = const
v2 = v1*(P1/P2)^(1/k);
% The next process is isobaric hence v/T = const
v3 = v2/T2*T3;

% W, Q, U, H calculations
% First process is adiabatic
W1 = (P2*v2-P1*v1)/(1-k);
U1 = Cv*(T2-T1);
Q1 = W1+U1;
H1 = Cp*(T2-T1);
% Second process is isobaric
W2 = P2*(v3-v2);
U2 = Cv*(T3-T2);
Q2 = W2 + U2;
H2 = Cp*(T3-T2);
% Third process is isothermal
W3 = P1*v1*log(P3/P1);
U3 = 0;
Q3 = W3+U3;
H3 = 0;

% P-V, P-T and T-V plots for the processes
vol1 = linspace(v1,v2,1000);
pre1 = P1*(v1./vol1).^k;
temp1 = linspace(T1,T2,1000);
vol2 = linspace(v2,v3,1000);
pre2 = linspace(P2,P3,1000);
temp2 = linspace(T2,T3,1000);
vol3 = linspace(v3,v1,1000);
pre3 = P3*v3./vol3;
temp3 = linspace(T3,T1,1000);
figure
plot(vol1,pre1,vol2,pre2,vol3,pre3);
xlabel("Specific Volume");
ylabel("Pressure (bar)")
title("P-V plot")
figure
plot(temp1,pre1,temp2,pre2,temp3,pre3);
xlabel("Temperature (K)");
ylabel("Pressure (bar)")
title("P-T plot")
figure
plot(vol1,temp1,vol2,temp2,vol3,temp3);
xlabel("Specific Volume");
ylabel("Temperature (K)");
title("T-V plot");

% Evaluating area under the P-V curve
A1 = trapz(vol1,pre1);
A2 = trapz(vol2,pre2);
A3 = trapz(vol3,pre3);

% Irreversible process
W1_irr = 0.75*W1;
Q1_irr = U1 + W1_irr;
W2_irr = 0.75*W2;
Q2_irr = U2 + W2_irr;
W3_irr = 0.75*W3;
Q3_irr = U3 + W3_irr;