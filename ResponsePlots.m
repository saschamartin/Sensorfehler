
% dz = cumtrapz(yCL(:,56)-yCL(:,7));
% z = cumtrapz(dz);
% 
% t2 = tiledlayout(3,1);
% nexttile
%     plot(t,z)
%     title("auslenkung")
% nexttile
%     plot(t,dz)
%     title("Geschwindigkeit")
% nexttile
%     plot(t,yCL(:,58)-yCL(:,7))
%     title("beschleunigung")




% tiledlayout(3,1)
% nexttile
% plot(t,uSq);
% ylabel("Actuation","Interpreter","latex")
% nexttile
% plot(t,yCL(:,7));
% ylabel("Y\_az\_B","Interpreter","latex")
% nexttile
% plot(t,yCL(:,12));
% ylabel("Y\_q","Interpreter","latex")
% 
% f2 =figure();
% plot(t,yCL(:,17))

tiledlayout(4,1)
nexttile
plot(t,uSq*180/pi)
ylabel("$Actuator [^{\circ}]$","Interpreter","latex")
nexttile
plot(t,yCL(:,50)-yCL(:,7));
ylabel("$Y\_IMU\_L5\_z [m/s^{2}]$","Interpreter","latex")
nexttile
plot(t,yCL(:,56)-yCL(:,7));
ylabel("$Y\_IMU\_L6\_z [m/s^{2}]$","Interpreter","latex")
nexttile
plot(t,(yCL(:,58)-yCL(:,12))*180/pi);
ylabel("$Y\_IMU\_L6\_ry [^{\circ}/s]$","Interpreter","latex")