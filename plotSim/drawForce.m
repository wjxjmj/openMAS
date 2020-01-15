function drawForce(forces,positions,la,color)
[d,n]=size(positions);
if d==2
    for i=1:n
        z=forces(:,i);
        nz=norm(z);
        if nz<10^(-4)
            w=0;
            z=[0;0];
        else
            w=tanh(norm(z)/5)*20;
            z=z./norm(z)*la*0.5;
        end
        
        x=[positions(1,i) positions(1,i)-z(1)];
        y=[positions(2,i) positions(2,i)-z(2)];
        if ~isnan(w)
        plot(x,y,color,'linewidth',0.1+w)
        end
        
    end
elseif d==3
    for i=1:n
        plot3([positions(1,i) positions(1,i)+forces(1,i)],[positions(2,i) positions(2,i)+forces(2,i)],[positions(3,i) positions(3,i)+forces(3,i)],color)
    end
end
end