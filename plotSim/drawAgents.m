function drawAgents(positions,type)
[d,~]=size(positions);
if type==1
    if d==2
        plot(positions(1,:),positions(2,:),'bo', 'MarkerFaceColor','b','MarkerSize',5)
        for i=1:size(positions,2)
            text(positions(1,i)-0.5,positions(2,i),num2str(i),'color','b')
        end
    end
    if d==3
        plot3(positions(1,:),positions(2,:),positions(3,:),'bo', 'MarkerFaceColor','b','MarkerSize',5)
    end
elseif type==2
    if d==2
        plot(positions(1,:),positions(2,:),'rp')
    end
    if d==3
        plot3(positions(1,:),positions(2,:),positions(3,:),'rp')
    end
elseif type==0
    if d==2
        plot(positions(1,:),positions(2,:),'kx')
    end
    if d==3
        plot3(positions(1,:),positions(2,:),positions(3,:),'kx')
    end
end