function [varargout] = fromTimeStream(timeStream)
global s_sizeList s_lengthList;
loop=size(timeStream,1);
for i=1:nargout
    varargout{i}=zeros([s_sizeList{i},loop]);
end
for t=1:loop
    stream=timeStream(t,:);
    iter=1;
    for i=1:nargout
        if length(s_sizeList{i})==2
            varargout{i}(:,:,t) = reshape(...
                stream(iter:iter+s_lengthList(i)-1)...
                ,s_sizeList{i});
            iter=iter+s_lengthList(i);
        else
%             new_size = [s_sizeList{i}(1),s_sizeList{i}(2)*s_sizeList{i}(3)];
            varargout{i}(:,:,:,t) = reshape(...
                stream(iter:iter+s_lengthList(i)-1)...
                ,s_sizeList{i});
            iter=iter+s_lengthList(i);
        end
    end
end
end
