function zHis=dataFlatten(xyHis)
[d,n,loop]=size(xyHis);
zHis=reshape(xyHis,[d*n,loop]);
end