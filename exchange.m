function [gate,arrivaltime_index,airplane2gate] = exchange(gate,arrivaltime_index,airplane2gate)
index=find(airplane2gate(:,2)==0);
airplaneindex=airplane2gate(index(ceil(rand()*length(index))),1);%�����ȡδ����ɻ����
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
        airplane2gate(find(airplane2gate(:,1)==airplaneindex),2)=airplane2gate(r,2);%����ɻ����ǻ���
        %airplane2gate(r,:)
        %airplane2gate(r,2)=0;
        %arrivaltime_index(r,6)=0;
        %arrivaltime_index(r,7)=999;
        arrivaltime_index(find(arrivaltime_index(:,1)==airplaneindex),6)=arrivaltime_index(find(arrivaltime_index(:,1)==arrivaltime_index(r,1)),6);%��ԭδ����ɻ���ǰһ�ɻ��ͺ�һ�ɻ�ʱ�����
        arrivaltime_index(find(arrivaltime_index(:,1)==airplaneindex),7)=arrivaltime_index(find(arrivaltime_index(:,1)==arrivaltime_index(r,1)),7);
        if gate(find(gate(:,1)==airplane2gate(r,2)),4)==arrivaltime_index(r,1)%���滻�ɻ�Ϊ���һ�ܷɻ�
            gate(find(gate(:,1)==airplane2gate(r,2)),4)=arrivaltime_index(find(arrivaltime_index(:,1)==airplaneindex),1);%���µǻ������һ�ܷɻ��ı��
            gate(find(gate(:,1)==airplane2gate(r,2)),3)=arrivaltime_index(find(arrivaltime_index(:,1)==airplaneindex),3);%���µǻ������һ�ܷɻ������ʱ��
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