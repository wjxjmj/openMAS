function [tHis,timeStream]=go(protocol)
global conf state grad result flockingProtocol

names=fieldnames(state);
len = length(names);
resultNames = cell(len,1);
values = cell(len,1);

for i=1:length(names)
    resultNames{i} = [names{i},'His'];
    value = state.(names{i});
    values{i}=value;
    grad.(['dot_',names{i}])=zeros(size(value));
    result.(resultNames{i})=[];
end
% result=cell2struct(cell(len,1),resultNames(:));

initStream(values{:});
state0 = toStream(values{:});

initProgressBar('simulating started');
flockingProtocol=protocol;
tspan=[0 conf.stime];
tHis=[];
timeStream=[];
if conf.simulator == 'ode45'
    timeSlice=conf.stime/conf.frame;
    lastState=state0;
    if conf.show_frame>conf.frame
        mount = ceil(conf.show_frame/conf.frame);
    end
    for t=1:conf.frame
        [kthTime,kthStream] = ode45(@sys,[(t-1)*timeSlice,t*timeSlice],lastState);
        kthSize = length(kthTime);
        tHis=[tHis;kthTime(round(linspace(1,kthSize,mount)),:)];
        timeStream=[timeStream;kthStream(round(linspace(1,kthSize,mount)),:)];
        lastState=kthStream(end,:);
    end
elseif conf.simulator == 'euler'
    [tHis,stream] = euler0(@sys,tspan,state0);
    timeStream=stream;
end

getResultFromTimeStream(timeStream);
result.tHis = tHis;
closeProgressBar()

end


function y=sys(t,s)
global conf flockingProtocol
getStateFromStream(s)
flockingProtocol(t);
y = setGradToStream();
updateProgressBar(t/conf.stime)
end

function [tHis,stream]=euler0(sys,tspan,state0)
global conf
loop = (tspan(2)-tspan(1))/conf.dt;
tHis=zeros(floor(loop/1000)+1,1);
tHis(1)=tspan(1);
t0=tspan(1);
stream = zeros(floor(loop/1000)+1,length(state0));
stream(1,:)=state0;
for t=1:loop
    t0=t0+para.dt;
    u = sys(t0,state0);
    state0=state0+conf.dt.*u;
    tHis(t)=t0;
    if mod(t,100)==1
        stream(t,:)=state0;
    end
end
stream(end,:)=state0;
end
