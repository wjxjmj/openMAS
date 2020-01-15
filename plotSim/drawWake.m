function drawWake(flattenData,d,k,tailLength,mark)
tail=tailLength;
[l,~]=size(flattenData);
n=l/d;

for i=1:n
    if d==2
        if k<=tailLength || tailLength<0
            plot(flattenData(2*i-1,1:k),flattenData(2*i-0,1:k),mark)
        else
            plot(flattenData(2*i-1,k-tail:k),flattenData(2*i-0,k-tail:k),mark)
        end
    elseif d==3
        if k<=tailLength || tailLength<0
            plot3(flattenData(3*i-2,1:k),flattenData(3*i-1,1:k),flattenData(3*i,1:k),mark)
        else
            plot3(flattenData(3*i-2,k-tail:k),flattenData(3*i-1,k-tail:k),flattenData(3*i,k-tail:k),mark)
        end
    end
end
end
