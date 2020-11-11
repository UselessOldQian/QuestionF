function [gateindex,gate,arrivaltime_index]=judgement(gate,airplane,arrivaltime_index,index1)
availablegate=find(gate(:,2)==airplane(1,5));
[gateindex,gate,arrivaltime_index]=insert(availablegate,gate,airplane,arrivaltime_index,index1);%获得登机口编号并更新登机口空闲时间
if gateindex==0
    air_str=num2str(airplane(5));
    air_str(2)='3';
    air_str1=num2str(airplane(5));
    air_str1(3)='3';
    availablegate1=find(gate(:,2)==str2num(air_str)|gate(:,2)==str2num(air_str1));
    [gateindex,gate,arrivaltime_index]=insert(availablegate1,gate,airplane,arrivaltime_index,index1);
    if gateindex==0
        air_str2=num2str(airplane(5));
        air_str2(2:3)='33';
        availablegate2=find(gate(:,2)==str2num(air_str2));
        [gateindex,gate,arrivaltime_index]=insert(availablegate2,gate,airplane,arrivaltime_index,index1);%获得登机口编号并更新登机口空闲时间
    end
end