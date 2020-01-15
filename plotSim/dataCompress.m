function [zHis,zdt]=dataCompress(xHis,dt,speed)
[~,~,loop]=size(xHis);
ts=dt*(loop-1);

if speed>loop || speed<0
    zHis=xHis;
    zdt=dt;
else
zHis=[];
skip=round(loop/speed);
if skip>1
    for k=1:skip:loop
        if k==1
            zHis=xHis(:,:,1);
        else
            zHis(:,:,end+1)=xHis(:,:,k);
        end
    end
    if k~=loop
        zHis(:,:,end+1)=xHis(:,:,end);
    end
end
[~,~,loop]=size(zHis);
zdt=ts/(loop-1);
end

end
