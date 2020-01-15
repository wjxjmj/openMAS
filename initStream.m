function initStream(varargin)
global s_sizeList s_lengthList;
if nargin==0
    s_sizeList='';
    s_lengthList='';
else
    for i=1:nargin
        n = ndims(varargin{i});
        s = size(varargin{i});
        l = 1;
        for j=1:n
            l=l*s(j);
        end
        s_lengthList(i)=l;
        s_sizeList{i}=s;
    end
end
end
