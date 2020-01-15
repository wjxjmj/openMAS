function plotSim(tHis,xHis,lHis)
global conf para
tailLength = conf.tailLength;
addpath(genpath(pwd));
[d,n,loop]=size(xHis);
skip = max(floor(loop/conf.show_frame),1);
wHis=dataFlatten(xHis);
wlHis=dataFlatten(lHis);
if d==2
    set(gcf,'renderer','painters')
end
[amin, amax, bmin, bmax]=dataGetArea(xHis);
hwait=waitbar(0,'>>>>>>>>>>');
for t=1:loop
    if mod(t,skip)>0
        continue
    end
    axis([amin amax bmin bmax]);
    clf
    hold on
    drawAgents(xHis(:,:,1),0);
    drawAgents(lHis(:,:,1),0);
    drawWake(wHis,d,t,tailLength,'c-')
    drawWake(wlHis,d,t,tailLength,'m--')
    drawAgents(xHis(:,:,t),1);
    drawAgents(lHis(:,:,t),2);
    for i=1:n
        xi = xHis(:,i,t);
        for j=1:n
            if i==j
                continue
            else            
                xj = xHis(:,j,t);
                dis = norm(xi-xj);
                if abs(dis-para.la)<=0.005
                    line([xi(1) xj(1)],[xi(2) xj(2)]);
                end
            end
        end
        drawCircle(xi,para.r,'[0.7,0.7,0.7]','--');
    end
    hold off
    
    axis equal
    title(['time = ' num2str(tHis(t)) ' s'],'fontsize',12)
    waitbar(t/loop,hwait,'plotting');
end
close(hwait);
rmpath(genpath(pwd));
end