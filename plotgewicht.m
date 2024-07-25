hold on
grid on
plot(1:95,K.B(2,:));
plot(1:95,K.B(8,:));

xlabel("Index der Sensoren")
ylabel("Gewichtung des Sensors")
title("Gewichtung der Eingangssignale")
legend("Werte der 2. Zeile", "Werte der 8. Zeile","Location","southeast")

x1 = xline(0,'-.','Sensoren Fuselage');
x2 = xline(19,'-.','Sensoren Flügel Links');
x3 = xline(60,'-.','Sensoren Flügel Rechts');
x1.HandleVisibility = "off";
x2.HandleVisibility = "off";
x3.HandleVisibility = "off";
hold off