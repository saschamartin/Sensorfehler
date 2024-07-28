ailerons = ["U_ail_l1" "U_ail_r1"];% "U_ail_l2" "U_ail_l3" "U_ail_r1" "U_ail_r2" "U_ail_r3"];
% Ruder = ["U_rud_l2" "U_rud_r2"];
% Schub = ["U_TN"];
% Break = ["U_airbrake_l" "U_airbrake_r"];

actuator = ailerons;
index = findselection(actuator,sysCL.InputName);

Tf = 10;
t0 = 1;
Tw = 4;
dt = 0.01;
amplitude = 10* (pi/180);

[uSq1,t] = signalgeneration(Tf,Tw,dt,amplitude,t0);

% Tf2 = 10;
% t02 = 5;
% Tw2 = 4;
% dt2 = 0.01;
% amplitude2 = -10* (pi/180);
% [uSq2,t] = signalgeneration(Tf2,Tw2,dt2,amplitude2,t02);

uSq =  uSq1;%+uSq2;
% amplitude = -10;
% t0 = 3;
% [uSq2,t] = signalgeneration(Tf,Tw,dt,amplitude,t0);
u = zeros(length(sysCL.InputName),length(t));
% 
% uSq = uSq+uSq2;

% [ui,t] = testvelocityprofile();
% u = zeros(length(sysCL.InputName),length(t));
for j=1:length(actuator)
    u(index(j),:) = -1^j *uSq;
end
[yCL,tOut,x,pOut] = lsim(sysCL,u,t);
% yOL = lsim(sysOL,u,t);

% Output = ["Y_IMU_L6_z" "Y_IMU_R6_z"];% "Y_IMU_L5_z" "Y_IMU_L6_z" "Y_IMU_L6_ry"];%,"Y_IMU_L1_y","Y_IMU_L1_z"];%,"Y_IMU_R1_x","Y_IMU_R1_y","Y_IMU_R1_z"];
% % Output = ["Y_V_ias" "Y_p_t" "Y_p_a"];
% % Output = ["Y_IMU_L5_ry" "Y_IMU_R5_ry"];
Output = ["Y_p","Y_q","Y_r"];
OutputPlot;