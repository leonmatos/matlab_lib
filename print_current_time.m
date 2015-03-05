function print_current_time(text)

if nargin == 0
    text = 'current time: ';
end

hh = hour(now); 
if hh < 10
    hh = ['0',num2str(hh)];
else
    hh = num2str(hh);
end
mm = minute(now);
if mm < 10
    mm = ['0',num2str(mm)];
else
    mm = num2str(mm);
end
ss = round(second(now));
if ss < 10
    ss = ['0',num2str(ss)];
else
    ss = num2str(ss);
end
tit = [text,hh,':',mm,':',ss];
disp(tit)