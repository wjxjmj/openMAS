function getStateFromStream(stream)
global s_sizeList s_lengthList state;
iter=1;
names=fieldnames(state);
len = length(names);
for i=1:len
    value = reshape(stream(iter:iter+s_lengthList(i)-1),s_sizeList{i});
    state.(names{i})=value;
    iter=iter+s_lengthList(i);
end
end
