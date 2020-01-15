function getResultFromTimeStream(timeStream)
global s_sizeList s_lengthList result conf;
loop=size(timeStream,1);
names = fieldnames(result);
len = length(names);
if conf.resultType == '3d'
    for i=1:len
        result.(names{i})=zeros([s_sizeList{i},loop]);
    end
    for t=1:loop
        stream=timeStream(t,:);
        iter=1;
        for i=1:len
            if length(s_sizeList{i})==2
                result.(names{i})(:,:,t) = reshape(...
                    stream(iter:iter+s_lengthList(i)-1)...
                    ,s_sizeList{i});
                iter=iter+s_lengthList(i);
            else
                %             new_size = [s_sizeList{i}(1),s_sizeList{i}(2)*s_sizeList{i}(3)];
                result.(names{i})(:,:,:,t) = reshape(...
                    stream(iter:iter+s_lengthList(i)-1)...
                    ,s_sizeList{i});
                iter=iter+s_lengthList(i);
            end
        end
    end
else
    iter=1;
    for i=1:len
        result.(names{i})=timeStream(:,iter:iter+s_lengthList(i)-1);
        iter=iter+s_lengthList(i);
    end
        
end
end
