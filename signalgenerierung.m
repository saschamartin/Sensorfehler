function [u,t] = signalgenerierung(len,width,dt,amplitude,t0)
%SIGNALGENERATION Generate an array of the desired signal amplitude
%   Detailed explanation goes here

t = 0:dt:len;
u = [];
inct0 = t0/dt;
incwidth = width/dt;
k=2;
freq = 8;


for i=1:(length(t))
    if i>inct0 && i <= (incwidth+inct0)
        % if sin((2*pi)/1 *i*dt)>0
        %     k=2;
        % else
        %     k=1;
        % end
        u=[u,(-1)^k * amplitude*pi/180];%*sin(2*pi*freq*t(i))];
    else
        u=[u,0];
    end
end
end

