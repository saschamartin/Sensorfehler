%% initialization

% plotting options 
xlim_range=[-15 15];
ylim_range=[-80 80];
wn_range=[10 80]; % to ignore pole in the origin which is also unstable

% V_IAS_arr=sysOL.SamplingGrid.V_IAS; % all air speeds

%% plot open loop (sysOL)

% plot
[~,~,~,d]=isUnst(sysOL,'xlim_range',xlim_range,'ylim_range',ylim_range,'wn_range',wn_range);
set(gcf,'Name','open-loop')

% evaluate flutter speed
dataOL=get(gca,'UserData');
V_IAS_OLflutter=V_IAS_arr(find(dataOL.isUnstIdx,1,'first'))

%% close loop
V_IAS_iArr=findselection(K.SamplingGrid.V_IAS,sysOL.SamplingGrid.V_IAS); % K is defined on a coarser grid (future task: interpolate K also for finer grided

% plot
isUnst(sysCL,'xlim_range',xlim_range,'ylim_range',ylim_range,'wn_range',wn_range);
set(gcf,'Name','closed-loop')

% evaluate flutter speed
dataCL=get(gca,'UserData');
V_IAS_CLflutter=V_IAS_arr(V_IAS_iArr(find(dataCL.isUnstIdx,1,'first')))
V_IAS_iArr()
poles =[];
for l=1:length(d{1})
    if sign(real(d{1}(l)))==1
        poles=[poles;l,d{1}(l)];
    end
end
