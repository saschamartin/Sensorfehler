
iMeasurement = findselection(Output,sysCL.OutputName);
react = figure('Name','Reaktion geschlossener Regelkreis','NumberTitle','off');
grid on

tiledlayout(length(Output)+1,1)

nexttile
title("Signal")
plot(t,uSq)
xlabel("Zeit [s]")
ylabel("Aktuierung")
speicher = [];
for i=1:length(Output)
    speicher(i,:) = yCL(:,iMeasurement(i));
    nexttile
    title(Output(i))
    plot(t,yCL(:,iMeasurement(i)));
    xlabel("Zeit [s]")
    ylabel(Output(i),"Interpreter","none")
end