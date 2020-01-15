function drawCircle(o,r,c,l)
zc=linspace(0,2*pi,1000);
xc=sin(zc).*r+o(1);
yc=cos(zc).*r+o(2);
plot(xc,yc,'linestyle',l,'color',c)
end