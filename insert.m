function [gateindex,gate,arrivaltime_index]=insert(availablegate,gate,airplane,arrivaltime_index,airplaneindex)%ȷ���ɻ�ͣ���ĸ��ǻ���
[a,index1]=sort(gate(availablegate,3));%���ݵǻ��ڿ���ʱ������
gateindex=0;%��ʼ�ǻ��ڱ��
for i=1:length(index1)
    if gate(availablegate(index1(length(index1)+1-i)),3)<=airplane(3)%�жϷɻ����ʱ���Ƿ��ڵǻ��ڿ���ʱ��֮��
        if gate(availablegate(index1(length(index1)+1-i)),3)<=airplane(2)%�жϷɻ���½ʱ���Ƿ��ڵǻ��ڿ���ʱ��֮��
            gateindex=gate(availablegate(index1(length(index1)+1-i)),1);%��ȡ�ǻ��ڱ��
            if gate(find(gate(:,1)==gateindex),4)~=0
                arrivaltime_index(gate(find(gate(:,1)==gateindex),4),7)=airplane(2);
            end
            arrivaltime_index(airplaneindex,6)=gate(find(gate(:,1)==gateindex),3);
            gate(find(gate(:,1)==gateindex),3)=airplane(3);%���µǻ��ڿ���ʱ��
            gate(find(gate(:,1)==gateindex),4)=airplaneindex;
            break;
        end
    end
end