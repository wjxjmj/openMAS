function stream = toStream(varargin)
global s_lengthList;
if nargin == 0
    initStream();
else
    stream = zeros(sum(s_lengthList),1);
    iter=1;
    for i=1:nargin
        stream(iter:iter+s_lengthList(i)-1)=reshape(varargin{i},[s_lengthList(i),1]);
        iter=iter+s_lengthList(i);
    end
end

end

