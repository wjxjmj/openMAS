function [amin,amax,bmin,bmax]=dataGetArea(xyHis)
amin=min(min(min(xyHis(1,:,:))));
amax=max(max(max(xyHis(1,:,:))));
bmin=min(min(min(xyHis(2,:,:))));
bmax=max(max(max(xyHis(2,:,:))));
aw=amax-amin;
if aw==0
    aw=1;
end
bw=bmax-bmin;
if bw==0
    bw=1;
end
amin=amin-0.05*aw;
amax=amax+0.05*aw;
bmin=bmin-0.05*bw;
bmax=bmax+0.05*bw;
end
