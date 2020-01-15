function varargout=dataSerialize(varargin)
if nargin <=1
    dataHis=varargin
else
    for i=1:nargin-1
        dataHis{i}=zeros([size(varargin()))
    
[loop,~]=size(data);
[x,v]=fromStream(data(1,:));
xHis=zeros(size(x,1),size(x,2),loop);
vHis=zeros(size(v,1),size(v,2),loop);
xHis(:,:,1)=x;
vHis(:,:,1)=v;
for t=2:loop
    [x,v]=fromStream(data(t,:));
    xHis(:,:,t)=x;
    vHis(:,:,t)=v;
end
end
