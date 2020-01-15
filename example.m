% Clear all variables.
clearvars
clear global

% Global structure variables, where
% para contains all parameters of your system,
% conf contains paramaters of the simulation and the visualization,
% state contains all state variables,
% and result contains the simulation results.
global conf para state result 

% configuration.
defaultConfiguration()
conf.stime=30;

% set parameters
para.n = 4;
para.d = 2;
para.la = 1;
para.r = 1.1;
para.h = 0.9;

% Fill the state variables into the global structure variable.
state.x  = unifrnd(-5,5,[para.d,para.n]);
state.xl = zeros(para.d,1);
state.v  = unifrnd(-0,0,[para.d,para.n]);
state.vl = ones(para.d,1).*0.1;

% Once you get the state, just go with your algorithm function.
go(@myProtocol1);

% When finished, take out the history data from the result global variable.
% For example, if you have assigned the speed to the state variable as
% state.speed = values, where values in R^(m*n), then there will be
% automatically a speedHis in result, where result.speedHis in
% R^(m*n*loop). Moreover, it also contains a tHis to provide the timestamp.

xHis = result.xHis;
xlHis = result.xlHis;
tHis = result.tHis;

% This visualization function need further improvement.
figure(1)
plotSim(tHis,xHis,xlHis)


% Thus function, using as a parameter in go function, describe the
% differential relations among your variables or functions.
function myProtocol1(t)
global para state grad

x = state.x;
xl = state.xl;
v = state.v;
vl = state.vl;

u=zeros(para.d,para.n);
ul=zeros(para.d,1);
phi=zeros(para.d,para.n,para.n);
for i=1:para.n
    xi = x(:,i);
    vi = v(:,i);
    for j=1:para.n
        if i==j
            continue
        else
            xj = x(:,j);
            vj = v(:,j);
            xij = xi-xj;
            vij = vi-vj;
            dis2=xij'*xij;
            aij=rho_h(dis2/para.r^2);
            phi(:,i,j)=aij*((xi-xj)'*(xi-xj)-para.la^2)*(xi-xj);
        end
        u(:,i)=u(:,i)-100*phi(:,i,j)-vij;
    end
    u(:,i)=u(:,i)+1*(xl-xi)+2*(vl-vi);
end

% The global variable grad contains all derivatives of your variable in
% the state and the items of the grad is also automatically assigned by
% adding the prefix 'dot_'.
grad.dot_x = v;
grad.dot_xl = vl;
grad.dot_v = u;
grad.dot_vl = ul;

end

% User defined function
function y=rho_h(z)
global para;
if z<para.h && z>=0
    y=1;
elseif z<=1 && z>=para.h
    y=0.5*(1+cos(pi*((z-para.h)/(1-para.h))));
else
    y=0;
end
end