function [airplane2gate,arrivaltime_index,gate]=greedyAl(arrivaltime_index,gate)
[a,index]=sort(arrivaltime_index(:,3));%���ɻ�������ʱ������
airplane2gate=zeros(size(arrivaltime_index,1),2);
airplane2gate=arrivaltime_index(:,1);%��ʼ���ɻ����Ų���
for i=1:size(arrivaltime_index,1)
    [gateindex,gate,arrivaltime_index]=judgement(gate,arrivaltime_index(index(i),:),arrivaltime_index,index(i));%ÿһ�ܷɻ���Ӧ�ǻ���
    airplane2gate(index(i),2)=gateindex;
end