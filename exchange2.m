function [arrivaltime_index,airplaneST,flag] = exchange2(gate,arrivaltime_index,airplaneST)
flag=0;
%ִ�зɻ��Ķ�Զཻ��
%�Ƚ��зɻ��Ľ������жϽ����Ƿ����
%�������һ���ǻ��ڣ��ҵ�����ǻ��ڵ����зɻ�������Щ�ɻ��������������Ҫ�����ɻ�����
%�����һ�ǻ��ڣ��ҵ�����ǻ��ڵ����зɻ�B���õ�FB.ǰ��<FA.�� & FB.��>FA.�� & FA.ǰ��<FB.�� & FA.��>FB.��
r=0;
A_isST=0;
while A_isST==0%ѡ��һ����A�ǻ��������ն�����ͬ�ĵǻ���B
    r=0;
    while r<=0||r>size(airplaneST,1)
        r=ceil(rand()*size(airplaneST,1));
    end
    A_isST=airplaneST(r,3);
end
exchange_gate_a=airplaneST(r,2);
airplane_gateA_index=find(airplaneST(:,2)==exchange_gate_a);
airplane_gateA_num=length(airplane_gateA_index);
select_airplane_num1=unidrnd(airplane_gateA_num);
select_airplane_num2=unidrnd(airplane_gateA_num);
select_airplane_num_max=max(select_airplane_num1,select_airplane_num2);
select_airplane_num_min=min(select_airplane_num1,select_airplane_num2);
[atime,airplane_gateA_index_ind]=sort(arrivaltime_index(airplane_gateA_index,2));
A=zeros(4,1);
A(1)=arrivaltime_index(airplane_gateA_index(airplane_gateA_index_ind(select_airplane_num_min)),2);
A(2)=arrivaltime_index(airplane_gateA_index(airplane_gateA_index_ind(select_airplane_num_max)),3);
A(3)=arrivaltime_index(airplane_gateA_index(airplane_gateA_index_ind(select_airplane_num_min)),6);
A(4)=arrivaltime_index(airplane_gateA_index(airplane_gateA_index_ind(select_airplane_num_max)),7);

B_isST=A_isST;
while B_isST==A_isST || B_isST==0%ѡ��һ����A�ǻ��������ն�����ͬ�ĵǻ���B
    rb=0;
    while rb<=0||rb>size(airplaneST,1)||rb==r
        rb=ceil(rand()*size(airplaneST,1));
    end
    B_isST=airplaneST(rb,3);
end
exchange_gate_b=airplaneST(rb,2);
airplane_gateB_index=find(airplaneST(:,2)==exchange_gate_b);
airplane_gateB_num=length(airplane_gateB_index);
[btime,airplane_gateB_index_ind]=sort(arrivaltime_index(airplane_gateB_index,2));
for i =1:airplane_gateB_num
    if A(1) >= arrivaltime_index(airplane_gateB_index(airplane_gateB_index_ind(i)),6) &...
            arrivaltime_index(airplane_gateB_index(airplane_gateB_index_ind(i)),2)>=A(3)
        for j = i:airplane_gateB_num
            if A(2) <= arrivaltime_index(airplane_gateB_index(airplane_gateB_index_ind(j)),7) &...
                    arrivaltime_index(airplane_gateB_index(airplane_gateB_index_ind(j)),3)<=A(4)
                typeA=arrivaltime_index(airplane_gateA_index(airplane_gateA_index_ind(select_airplane_num_min:select_airplane_num_max)),5);
                typeB=arrivaltime_index(airplane_gateB_index(airplane_gateB_index_ind(i:j)),5);
                gateAtype=gate(find(gate(:,1)==exchange_gate_a),2);
                gateBtype=gate(find(gate(:,1)==exchange_gate_b),2);
                can_insertA=compatibility(typeA,gateBtype);
                can_insertB=compatibility(typeB,gateAtype);
                if can_insertA==1 && can_insertB==1
                    flag=1;
                    airplaneST(airplane_gateA_index(airplane_gateA_index_ind(select_airplane_num_min:select_airplane_num_max)),2)...
                        =ones(size(typeA,1),1)*exchange_gate_b;
                    airplaneST(airplane_gateB_index(airplane_gateB_index_ind(i:j)),2)...
                        =ones(size(typeB,1),1)*exchange_gate_a;
                    airplaneST=isST(airplaneST);
                    tempmin=arrivaltime_index(airplane_gateA_index(airplane_gateA_index_ind(select_airplane_num_min)),6);
                    tempmax=arrivaltime_index(airplane_gateA_index(airplane_gateA_index_ind(select_airplane_num_min)),7);
                    arrivaltime_index(airplane_gateA_index(airplane_gateA_index_ind(select_airplane_num_min)),6)...
                        =arrivaltime_index(airplane_gateB_index(airplane_gateB_index_ind(i)),6);
                    arrivaltime_index(airplane_gateA_index(airplane_gateA_index_ind(select_airplane_num_max)),7)...
                        =arrivaltime_index(airplane_gateB_index(airplane_gateB_index_ind(j)),7);    
                    arrivaltime_index(airplane_gateB_index(airplane_gateB_index_ind(i)),6)=tempmin;
                    arrivaltime_index(airplane_gateB_index(airplane_gateB_index_ind(j)),7)=tempmax;  
                    %airplaneST(airplane_gateA_index(airplane_gateA_index_ind(select_airplane_num_min:select_airplane_num_max)),1);
                    %'  ';
                    %airplaneST(airplane_gateB_index(airplane_gateB_index_ind(i:j)),1);
                    return
                end
            end
        end
    end
end
    