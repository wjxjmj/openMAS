function drawBox(o,r,th,c,l)
d = length(o);
if d==2
    p1=[o(1)+0.5*r;o(2)+0.5*r];
    p2=[o(1)+0.5*r;o(2)-0.5*r];
    p3=[o(1)-0.5*r;o(2)-0.5*r];
    p4=[o(1)-0.5*r;o(2)+0.5*r];
    m=[cos(th) -sin(th);sin(th) cos(th)];
    p1=m*p1;
    p2=m*p2;
    p3=m*p3;
    p4=m*p4;
    
    drawLine(p1,p2,c,l);
    drawLine(p2,p3,c,l);
    drawLine(p3,p4,c,l);
    drawLine(p4,p1,c,l);

end
end