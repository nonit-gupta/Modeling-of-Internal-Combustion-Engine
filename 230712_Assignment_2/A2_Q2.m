k = 1.35;
P1 = 110; % (kPa)
T1 = 400; % (K)
T3 = 2800; % (K)
bore = 0.09; % (m) 
stroke = 0.1; % (m)
crl = 0.14; % (m)
CR = 8.5;

V_swept = pi/4*bore^2*stroke;
V_clearance = V_swept/(CR-1);
V1 = V_swept+V_clearance;

% The process 1 --> 2 is adiabatic (isoentropic compression)
V2 = V_clearance;
P2 = P1*(CR^k);
T2 = T1*(CR^(k-1));
% The process 2 --> 3 is constant volume
V3 = V2;
P3 = T3*P2/T2;
% The process 3 --> 4 is adiabatic (isoentropic expansion)
V4 = V1;
P4 = P3*(V3/V4)^k;
T4 = T3*(V3/V4)^(k-1);
% Thermal efficiency of Otto Cycle is given by: 1-1/(CR^(k-1))
n = 1-1/(CR^(k-1));
% P-V graph for Otto Cycle
hold on;
figure (1)
plot(linspace(V1,V2,1000),linspace(P1,P2,1000));
plot(linspace(V2,V3,1000),linspace(P2,P3,1000));
plot(linspace(V3,V4,1000),linspace(P3,P4,1000));
plot(linspace(V4,V1,1000),linspace(P4,P1,1000));
plot(V1,P1,'*','color','r')
plot(V2,P2,'*','color','r')
plot(V3,P3,'*','color','r')
plot(V4,P4,'*','color','r')
legend("Isoentropic compression","Constant Volume Heat Addition","Isoentropic expansion","Constant Volume Heat Rejection")
title("P-V graph of Otto Cycle")
xlabel("Volume (m^3)")
ylabel("Pressure (kPa)")
grid on
hold off;

constant_c = P1*V1^k;
V_compression = piston_kinematics(bore,stroke,crl,CR,180,0);
P_compression = constant_c./V_compression.^k;
constant_c = P3*V3^k;
V_expansion = piston_kinematics(bore,stroke,crl,CR,180,360);
P_expansion = constant_c./V_expansion.^k;
figure
hold on
grid on
plot(V_compression,P_compression,'linewidth',1.5,'color', 'c')
plot(V_expansion,P_expansion,'linewidth',1.5,'color', 'c' )
plot([V2 V3],[P2 P3],'linewidth',1.5,'color', 'g')
plot([V4 V1],[P4 P1],'linewidth',1.5,'color', 'g')
plot(V1,P1,'*','color','r')
plot(V2,P2,'*','color','r')
plot(V3,P3,'*','color','r')
plot(V4,P4,'*','color','r')
xlabel('Volume (m^3)')
ylabel('Pressure (kPa)')
legend("Isoentropic compression","Constant Volume Heat Addition","Isoentropic expansion","Constant Volume Heat Rejection")
title("P-V graph for Otto Cycle")

% Additional Task:
x = linspace(1,25,1000);
y = 1 - x.^(1-k);
figure
plot(x,y);
title("Thermal Efficiency v/s Compression Ratio")
xlabel("Compression Ratio")
ylabel("Thermal Efficiency of Otto Cycle")
hold on;
x_points = [7,9,11];
y_points = 1-x_points.^(1-k);
plot(x_points,y_points,'ro');
hold off;
grid on