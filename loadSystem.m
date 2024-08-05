% add PMtools first

ccc
cd 'C:\Users\sp-ma\Documents\Studium\Bachelorarbeit\Sensorfehler\Faulttolerant Flutter Suppression\model';

K=loadvar('DLRFlutterController_8_2','K');
sysOL = loadvar('sys_lin_new_1wing_8_2_flutterMass','sys_lin');

%% Output selection
iOutput = [7 12 26 32 34 38 44 46 50 56 58 62 68 70 74 80 82 86 92 94];

%% Indizes der Geschwindigkeiten im "SamplingGrid"
% Es wird ein System gewählt für welches gilt dass es instabil in der
% Offenen Schleife ist und stabil in einem geschlossenen Regelkreis.
% Gewählte Geschwindigkeit: 56 m/s
% Ein weiteres System wird hinzugefügt welches als Vergleich bei höheren
% Geschwindigkeiten dient:
% Gewählte Geschwindigkeit: 60 m/s
VeloIndexSys56 = 27;
VeloIndexK56 = 14;
VeloIndexSys60 = 31;
VeloIndexK60 = 16;

cd 'C:\Users\sp-ma\Documents\Studium\Bachelorarbeit\Sensorfehler\Faulttolerant Flutter Suppression\script';

%% Sensor loss
% Wird aktuell nicht mehr verwendet
% check = 0;
% if check == 1
%     SensorLoss
% end

%% closed loop system (sysCL)

relOutput = 1:1:length(K.InputName); %zu viele Ausgänge von Regelstrecke -> Reduktion durch Namensvergleich der Signale
K56 = K(:,:,VeloIndexK56);
sysOL56 = sysOL(relOutput,:,VeloIndexSys56);
sysCL56 = feedback(sysOL56,K56);

K60 = K(:,:,VeloIndexK60);%*G;
sysOL60 = sysOL(relOutput,:,VeloIndexSys60);
sysCL60 = feedback(sysOL60,K60);

K = K(:,:,15);
sysOL = sysOL(relOutput,:,29);