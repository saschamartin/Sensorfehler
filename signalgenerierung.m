function [u,t] = signalgenerierung(len,width,dt,amplitude,t0)
%SIGNALGENERATION Erstellen von einem Vektor des Signals
%   Vektor u besteht aus Elementen die das Signal wiedergeben, Vektor t hat
%   die gleiche Länge und stellt die Zeitpunkte von u dar. 

    t = 0:dt:len;
    u = [];
    inct0 = t0/dt;
    incwidth = width/dt;
    % freq = 8;
    
    for i=1:(length(t))
        if i>inct0 && i <= (incwidth+inct0)
            u=[u,amplitude*pi/180];
        else
            u=[u,0];
        end
    end
end

