function [gateindex,gate,arrivaltime_index]=insert(availablegate,gate,airplane,arrivaltime_index,airplaneindex)%确定飞机停靠哪个登机口
[a,index1]=sort(gate(availablegate,3));%根据登机口空闲时间排序
gateindex=0;%初始登机口编号
for i=1:length(index1)
    if gate(availablegate(index1(length(index1)+1-i)),3)<=airplane(3)%判断飞机起飞时间是否在登机口空闲时间之后
        if gate(availablegate(index1(length(index1)+1-i)),3)<=airplane(2)%判断飞机着陆时间是否在登机口空闲时间之后
            gateindex=gate(availablegate(index1(length(index1)+1-i)),1);%获取登机口编号
            if gate(find(gate(:,1)==gateindex),4)~=0
                arrivaltime_index(gate(find(gate(:,1)==gateindex),4),7)=airplane(2);
            end
            arrivaltime_index(airplaneindex,6)=gate(find(gate(:,1)==gateindex),3);
            gate(find(gate(:,1)==gateindex),3)=airplane(3);%更新登机口空闲时间
            gate(find(gate(:,1)==gateindex),4)=airplaneindex;
            break;
        end
    end
end