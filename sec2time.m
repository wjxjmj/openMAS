function str=sec2time(sec)
sec=floor(sec);
if sec<60
    str=sprintf('%d second(s)',sec);
elseif sec<60^2
    a=mod(sec,60);
    b=(sec-a)/60;
    str=sprintf('%d minute(s)',b);
elseif sec<60^2*24
    a=mod(sec,60);
    b=mod((sec-a)/60,60);
    c=(sec-b*60-a)/60/60;
    str=sprintf('%d hour(s)',c);
elseif sec<60^2*24*30
    d=floor(sec/60/60/24);
    str=sprintf('%d day(s)',d);
elseif sec<60^2*24*365
    d=floor(sec/60/60/24/30);
    str=sprintf('%d month(s)',d);
else
    d=floor(sec/60/60/24/365);
    str=sprintf('%d year(s)',d);
end
end