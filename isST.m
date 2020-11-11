function airplaneST=isST(airplaneST)%根据飞机分配登机口确定其ST属性
for i=1:length(airplaneST(:,1))
    if airplaneST(i,2)==0%未分配登机口飞机不予考虑
        airplaneST(i,3)=0;
        continue
    end
    if airplaneST(i,2)>100
        if floor(airplaneST(i,2)/200)==0 %编号1开头的登机口为S
            airplaneST(i,3)=1;
        else
            airplaneST(i,3)=2; %编号2开头的登机口为T
        end
    else
        if floor(airplaneST(i,2)/20)==0
            airplaneST(i,3)=1;
        else
            airplaneST(i,3)=2;
        end
    end
end