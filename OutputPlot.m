
iMeasurement = findselection(Output,sysCL.OutputName);
react = figure('Name','Reaction ClosedLoop','NumberTitle','off');
grid on

tiledlayout(length(Output)+1,1)

nexttile
title("Signal")
plot(t,uSq)
xlabel("time")
ylabel("actuation")
speicher = [];
for i=1:length(Output)
    speicher(i,:) = yCL(:,iMeasurement(i));
    nexttile
    title(Output(i))
    plot(t,yCL(:,iMeasurement(i)));
    xlabel("time")
    ylabel(Output(i))
end