function [tHis,timeStream]=multi_agent_systems(protocol,varargin)
global para flockingProtocol

% x0=unifrnd(-2,2,[para.d,para.n]);
% xl=zeros(para.d,1);
% v0=unifrnd(-1,1,[para.d,para.n]);
% vl=zeros(para.d,1);
% initStream(x0,v0,th0,b0,xl,vl);
% state0 = toStream(x0,v0,th0,b0,xl,vl);
initStream(varargin{1:end});
state0 = toStream(varargin{1:end});
% hh=waitbar(0,'ode45 is starting!');
initProgressBar('simulating started');
flockingProtocol=protocol;
tspan=[0 para.stime];
tHis=[];
timeStream=[];
if para.simulator == 'ode45'
    timeSlice=para.stime/para.frame;
    lastState=state0;
    for t=1:para.frame
        [kthTime,kthStream] = ode45(@sys,[(t-1)*timeSlice,t*timeSlice],lastState);
        tHis=[tHis;kthTime(end,:)];
        timeStream=[timeStream;kthStream(end,:)];
        lastState=kthStream(end,:);
    end
elseif para.simulator == 'euler'
    [tHis,stream] = euler0(@sys,tspan,state0);
    timeStream=stream;
end
    
closeProgressBar()

end


function y=sys(t,s)
global para flockingProtocol
y=flockingProtocol(s);
updateProgressBar(t/para.stime)
end

function [tHis,stream]=euler0(sys,tspan,state0)
global para
loop = (tspan(2)-tspan(1))/para.dt;
tHis=zeros(floor(loop/1000)+1,1);
tHis(1)=tspan(1);
t0=tspan(1);
stream = zeros(floor(loop/1000)+1,length(state0));
stream(1,:)=state0;
for t=1:loop
    t0=t0+para.dt;
    u = sys(t0,state0);
    state0=state0+para.dt.*u;
    tHis(t)=t0;
    if mod(t,100)==1
        stream(t,:)=state0;
    end
end
stream(end,:)=state0;
end
