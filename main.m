pmtools = 'C:\Users\sp-ma\Documents\Studium\Bachelorarbeit\Sensorfehler\Abgabe\PMtools\autrun.m';
run(pmtools);

loadSystem;
cd 'C:\Users\sp-ma\Documents\Studium\Bachelorarbeit\Sensorfehler\Abgabe';
Signal = [7 12 26 32 34 38 44 46 50 56 58 62 68 70 74 80 82 86 92 94];


%% check for stability of system

% mmio = diskmargin(sysOL(relOutput,:,:),K);

%% rigid body mode decoupling
% freqsep(system, frequency range to ignore) ->
% [G1,G2] = freqsep(sysOL(relOutput,:,:), 0.4148 + 1) 1 Hz als "toleranz"
% G2 ist das schnelle System und wird weiterverwendet

%Analyse von zwei Geschwindigkeiten gleichzeitig 56 und 60 m/s.
[G156,G256] = freqsep(sysOL56(relOutput,:),1.4148);
sysOL56 = G256;
[G160,G260] = freqsep(sysOL60(relOutput,:),1.4148);
sysOL60 = G260;