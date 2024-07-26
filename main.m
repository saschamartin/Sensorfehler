pmtools = 'C:\Users\sp-ma\Documents\Studium\Bachelorarbeit\Sensorfehler\Abgabe\PMtools\autrun.m';
run(pmtools);

loadSystem;
cd 'C:\Users\sp-ma\Documents\Studium\Bachelorarbeit\Sensorfehler\Abgabe';
Signal = [7 12 26 32 34 38 44 46 50 56 58 62 68 70 74 80 82 86 92 94];

% testausschlaege;

%% check for stability of system

% mmio = diskmargin(sysOL(relOutput,:,:),K);

%% rigid body mode decoupling
% freqsep(system, frequency range to ignore) ->
% [G1,G2] = freqsep(sysOL(relOutput,:,:), 0.005/2pi + 1 [Hz]) 1 hz als "toleranz"
% G2 is the "fast" system. will be needed for future analysis

[G1,G2] = freqsep(sysOL(relOutput,:),1.4148);
sysOL = G2;