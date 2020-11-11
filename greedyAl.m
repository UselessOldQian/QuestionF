function [airplane2gate,arrivaltime_index,gate]=greedyAl(arrivaltime_index,gate)
[a,index]=sort(arrivaltime_index(:,3));%将飞机按到达时间排序
airplane2gate=zeros(size(arrivaltime_index,1),2);
airplane2gate=arrivaltime_index(:,1);%初始化飞机安排策略
for i=1:size(arrivaltime_index,1)
    [gateindex,gate,arrivaltime_index]=judgement(gate,arrivaltime_index(index(i),:),arrivaltime_index,index(i));%每一架飞机对应登机口
    airplane2gate(index(i),2)=gateindex;
end