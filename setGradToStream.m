function u = setGradToStream()
global s_lengthList grad;
 
u = zeros(sum(s_lengthList),1);
iter=1;
names=fieldnames(grad);
len = length(names);
for i=1:len
    u(iter:iter+s_lengthList(i)-1)=reshape(grad.(names{i}),[s_lengthList(i),1]);
    iter=iter+s_lengthList(i);
end
end
