function drawCircle3d(centre,radius,normal,color,linestyle)
s=linspace(0,2*pi,1000);
xc=sin(s).*radius+centre(1);
yc=cos(s).*radius+centre(2);
plot(xc,yc,'linestyle',linestyle,'color',color)
end