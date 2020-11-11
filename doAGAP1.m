x=ones(1,10)*20;
for i = 1:5
    [x(i),b,arrivaltime_index,gate]=AGAP1();
    [num,index]=min(x);
    if index==i
        assign=b;
        airplane=arrivaltime_index;
        g=gate;
    end
    if num<=5
        return
    end
    num
    i
end