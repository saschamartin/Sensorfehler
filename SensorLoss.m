loss = ["Y_IMU_R6_z"];
iloss = findselection(loss,sysOL.OutputName);
sysOL(iloss,:,:) = 0;
% sysCL=feedback(sysOL(relOutputs,:,:),K);