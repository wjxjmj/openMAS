function [varargout] = fromStream(stream)
global s_sizeList s_lengthList;
iter=1;
for i=1:nargout
    varargout{i} = reshape(...
        stream(iter:iter+s_lengthList(i)-1)...
        ,s_sizeList{i});
    iter=iter+s_lengthList(i);
end
end
