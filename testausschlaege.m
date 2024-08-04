%% Definition der auszulenkenden Steuersignale
% ailerons = ["U_ail_l1" "U_ail_r1"];
Ruder = ["U_rud_l1" "U_rud_r1" "U_rud_l2" "U_rud_r2"];
% Schub = ["U_TN"];
% Break = ["U_airbrake_l" "U_airbrake_r"];

actuator = Ruder;
index = findselection(actuator,sysCL.InputName);

%% Definition des Anregungssignals
Tf = 10;    %Zeitfenster
t0 = 1;     %Startzeitpunkt
Tw = 9;     %Signalbreite: Tw <= Tf-t0
dt = 0.01;  %Schrittweite
amplitude = 10* (pi/180);   %Amplitude der Auslenkung

[uSq1,t] = signalgenerierung(Tf,Tw,dt,amplitude,t0);
% t = 0:dt:Tf;
% uSq1 = chirp(t,1,Tf,10,"linear",-90)*amplitude;
uSq =  uSq1;
u = zeros(length(sysCL.InputName),length(t));
for j=1:length(actuator)
    u(index(j),:) = uSq;
end

%% Simulation und Output
[yCL,tOut,x,pOut] = lsim(sysCL,u,t);

% Output = ["Y_IMU_R5_z" "Y_IMU_L6_z" "Y_IMU_R6_ry"];
Output = ["Y_p","Y_q","Y_r"];
OutputPlot;