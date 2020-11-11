function [gate,arrivaltime_index,airplane2gate] = exchange(gate,arrivaltime_index,airplane2gate)
index=find(airplane2gate(:,2)==0);
airplaneindex=airplane2gate(index(ceil(rand()*length(index))),1);%随机获取未分配飞机编号
for i=1:length(arrivaltime_index(:,1))
    r=0;
    while r<=0||r>length(airplane2gate(:,2))||airplane2gate(r,2)==0
        r=ceil(rand()*length(arrivaltime_index(:,1)));
    end
    replace_airplane_gate=airplane2gate(r,2);
    type_gate=gate(find(gate(:,1)==replace_airplane_gate),2);
    type_airplane=arrivaltime_index(find(arrivaltime_index(:,1)==airplaneindex),5);
    %replace_gateindex=code_match(type_airplane);
    can_replace = compatibility(type_airplane,type_gate);
    if arrivaltime_index(r,6)<=arrivaltime_index(find(arrivaltime_index(:,1)==airplaneindex),2)&&...
            arrivaltime_index(r,7)>=arrivaltime_index(find(arrivaltime_index(:,1)==airplaneindex),3)&&...
            airplane2gate(r,2)~=0 && can_replace==1
        airplane2gate(find(airplane2gate(:,1)==airplaneindex),2)=airplane2gate(r,2);%分配飞机到登机口
        %airplane2gate(r,:)
        %airplane2gate(r,2)=0;
        %arrivaltime_index(r,6)=0;
        %arrivaltime_index(r,7)=999;
        arrivaltime_index(find(arrivaltime_index(:,1)==airplaneindex),6)=arrivaltime_index(find(arrivaltime_index(:,1)==arrivaltime_index(r,1)),6);%将原未分配飞机的前一飞机和后一飞机时间更新
        arrivaltime_index(find(arrivaltime_index(:,1)==airplaneindex),7)=arrivaltime_index(find(arrivaltime_index(:,1)==arrivaltime_index(r,1)),7);
        if gate(find(gate(:,1)==airplane2gate(r,2)),4)==arrivaltime_index(r,1)%若替换飞机为最后一架飞机
            gate(find(gate(:,1)==airplane2gate(r,2)),4)=arrivaltime_index(find(arrivaltime_index(:,1)==airplaneindex),1);%更新登机口最后一架飞机的编号
            gate(find(gate(:,1)==airplane2gate(r,2)),3)=arrivaltime_index(find(arrivaltime_index(:,1)==airplaneindex),3);%更新登机口最后一架飞机的起飞时间
        end
        airplane2gate(r,2)=0;
        arrivaltime_index(r,6)=0;
        arrivaltime_index(r,7)=999;
        [gateindex,gate,arrivaltime_index]=judgement(gate,arrivaltime_index(r,:),arrivaltime_index,r);
        airplane2gate(r,2)=gateindex;
        if gateindex==0
            [gateindex,gate,arrivaltime_index,airplane2gate]=judgement_new(gate,arrivaltime_index(r,:),arrivaltime_index,r,airplane2gate);
        end
        airplane2gate(r,2)=gateindex;
        return;
    end
end