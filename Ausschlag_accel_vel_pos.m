testausschlaege;

yCL(:,86)=yCL(:,86)-yCL(:,7);
yCL(:,92)=yCL(:,92)-yCL(:,7);
yCL(:,94)=yCL(:,94)-yCL(:,12);

hold on
title("Acceleration and Omega")
tiledlayout(4,1)
nexttile
plot(1:length(t),uSq);
nexttile
plot(1:length(t),yCL(:,86))
nexttile
plot(1:length(t),yCL(:,92))
nexttile
plot(1:length(t),yCL(:,94))
hold off

v86 = cumtrapz(yCL(:,86));
v92 = cumtrapz(yCL(:,92));
psi94 = cumtrapz(yCL(:,94));

hold on
title("Velocities and Angle")
tiledlayout(4,1)
nexttile
plot(1:length(t),uSq);
nexttile
plot(1:length(t),v86)
nexttile
plot(1:length(t),v92)
nexttile
plot(1:length(t),psi94)
hold off


x86 = cumtrapz(v86);
x92 = cumtrapz(v92);

hold on
title("displacement")
tiledlayout(3,1)
nexttile
plot(1:length(t),uSq);
nexttile
plot(1:length(t),x86)
nexttile
plot(1:length(t),x92)
hold off

hold on
tiledlayout(3,1)
nexttile
plot((1:length(t))/100,yCL(:,86))
xlabel("time [t]")
ylabel("Beschl. [m/s^2]")
nexttile
plot((1:length(t))/100,v86)
ylabel("Geschw. [m/s]")
xlabel("time [t]")
nexttile
plot((1:length(t))/100,x86)
ylabel("Pos. [m]")
xlabel("time [t]")
hold off