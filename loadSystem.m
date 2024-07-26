% add PMtools first

ccc
cd 'C:\Users\sp-ma\Documents\Studium\Bachelorarbeit\Sensorfehler\Faulttolerant Flutter Suppression\model';
% K=loadvar('24-03-20_Model','K');
% sys=loadvar('24-03-20_Model','lin_sys');

K=loadvar('DLRFlutterController_8_2','K');
% sys = load('reducedSystem','G2');
sysOL = loadvar('sys_lin_new_1wing_8_2_flutterMass','sys_lin');
% sysOL = sys.G2;

%% Output selection
iOutput = [7 12 26 32 34 38 44 46 50 56 58 62 68 70 74 80 82 86 92 94];

%% which system to use
% currently it is of interest to observe a system which is unstable in the
% open loop, but stable in the closed loop -> therefore a system for the plant and the controler
% @ a velocity is chosen where these conditions apply:  56 m/s 
VeloIndexSys = 27;
VeloIndexK = 14;

%% decomposition into a "fast" and "slow" system
% from previous iterations it is found that a right half pole is @ 0,005,
% since it is a "slow" pole it is attriubuted to the rigid body motion and
% should be ignored in this analysis. 
% omega = 0.005;
% f = omega/(2*pi);
% tolerance = 1; %1 hertz of tolerance to ignore (can/should be adapted)
% [G1,G2] = freqsep(sys(:,:,VeloIndexSys),f+tolerance);

%% open loop system (sysOL)

%% Sensor loss
cd 'C:\Users\sp-ma\Documents\Studium\Bachelorarbeit\Sensorfehler\Faulttolerant Flutter Suppression\script';
% check = 0;
% if check == 1
%     SensorLoss
% end

%% closed loop system (sysCL)
% G = ones(95,1);
% index = [68 80];
% G(index)=[0.001 4.1402];
% G = diag(G);
K = K(:,:,VeloIndexK);%*G;
relOutput = 1:1:length(K.InputName);%too many outputs from sys for K -> using just the necessary inputs
sysOL = sysOL(relOutput,:,VeloIndexSys);
sysCL = feedback(sysOL,K);

% %% discrete time
% T=0.001; %sampling time
% Isys=eye(size(sysOL.A));
% sysA_d=(Isys+sysOL.A*T);
% sysB_d=T*sysOL.B;
% sysC_d=sysOL.C;
% sysD_d=sysOL.D;
% 
% IK=eye(size(K.A));
% KA_d=(IK-K.A*T);
% KB_d=T*K.B;
% KC_d=K.C;
% KD_d=K.D;

% %% plot open loop (sys)
% % 
% % relOutputs = 1:1:length(K.InputName);%too many outputs from sys for K -> using just the necessary inputs
% % 
% %for just one System in the beginning: Should be above OpenLoop flutter
% %velo and below ClosedLoop flutter velocity. --> 50<vel<64 m/s -> 56 m/s
% %hat Index 27 input in feedback instead of "V_IAS_iArr"
% VeloIndexSys =1;% 27;
% sysOL=sys(:,:,VeloIndexSys);
% 
% %% close loop
% % 
% relOutputs = 1:1:length(K.InputName);%too many outputs from sys for K -> using just the necessary inputs
% % 
% %for just one System in the beginning: Should be above OpenLoop flutter
% %velo and below ClosedLoop flutter velocity. --> 50<vel<64 m/s -> 56 m/s
% %hat Index 27 input in feedback instead of "V_IAS_iArr"
% VeloIndexSys = 1;%27; %
% VeloIndexK = 1;%14; %
% K=K(:,:,VeloIndexK);
% 
% % loss = ["Y_IMU_L1_x" "Y_IMU_L1_y" "Y_IMU_L1_z" "Y_IMU_L1_rx" "Y_IMU_L1_ry" "Y_IMU_L1_rz" "Y_IMU_L2_x" "Y_IMU_L2_y" "Y_IMU_L2_z" "Y_IMU_L2_rx" "Y_IMU_L2_ry" "Y_IMU_L2_rz" "Y_IMU_L3_x" "Y_IMU_L3_y" "Y_IMU_L3_z" "Y_IMU_L3_rx" "Y_IMU_L3_ry" "Y_IMU_L3_rz" "Y_IMU_R1_x" "Y_IMU_R1_y" "Y_IMU_R1_z" "Y_IMU_R1_rx" "Y_IMU_R1_ry" "Y_IMU_R1_rz" "Y_IMU_R2_x" "Y_IMU_R2_y" "Y_IMU_R2_z" "Y_IMU_R2_rx" "Y_IMU_R2_ry" "Y_IMU_R2_rz" "Y_IMU_R3_x" "Y_IMU_R3_y" "Y_IMU_R3_z" "Y_IMU_R3_rx" "Y_IMU_R3_ry" "Y_IMU_R3_rz"];
% % iloss = findselection(loss,sys.OutputName);
% % sys(iloss,:,VeloIndexSys) = 0;
% sysCL=feedback(sysOL(relOutputs,:,:),K);