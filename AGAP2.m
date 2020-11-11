function airplaneST=AGAP2
clear all
clc
filename = 'pucks1.txt';
fid = fopen(filename,'r');
tline = fgetl(fid); 
airline_info=cell(303,3);
ind=1;
while ischar(tline)
    data = regexp(tline, ' ', 'split');
    airline_info(ind,1)= data(1);
    airline_info(ind,2)= data(2);
    airline_info(ind,3)=data(3);
    tline = fgetl(fid);
    ind=ind+1;
end
fclose(fid);

filename2 = 'Tickets3.txt';
fid2 = fopen(filename2,'r');
tline2 = fgetl(fid2);
ind2=1;
passenger_info=cell(1733,3);
while ischar(tline2)
    data2 = regexp(tline2, ' ', 'split');
    passenger_info(ind2,1)=data2(1);
    passenger_info(ind2,2)=data2(2);
    passenger_info(ind2,3)=data2(3);
    tline2 = fgetl(fid2);
    ind2=ind2+1;
end
fclose(fid2);

[nogate,airplane2gate,arrivaltime_index,gate]=AGAP1();%���ݵ�һ����㷨���ɳ�ʼ��
global matrix_airline
matrix_airline=zeros(303,303);
matrix_airline=bulidmatrix(matrix_airline,passenger_info,airline_info);%�����˿͵Ľ���ɻ��������ɻ�����������
gate_expand=zeros(length(airplane2gate(:,1)),1);
airplaneST=[airplane2gate gate_expand];
airplaneST=isST(airplaneST);%���ݷɻ�����ǻ���ȷ����ST����
global airplane_departure_arrival_DI
airplane_departure_arrival_DI=isDI(arrivaltime_index);%ȷ���ɻ�����ɽ���Ĺ��ڹ������ԣ�����ɾ�����ʽ
global p
[x,y]=find(matrix_airline>0);
p=zeros(size(x,1),1);
for i =1:size(x,1)
    p(i)=matrix_airline(x(i),y(i));
end
%�˻��㷨
temperature = 100;                 % ��ʼ�¶�
cooling_rate = 0.94;                % ��ȴ��
iterations = 1;                     % ��������
temperature_iterations = 1;
plot_iterations = 1;
cost=calcu_cost(airplane_departure_arrival_DI,airplaneST,arrivaltime_index);
previous_cost=cost;
best_arrenge=airplaneST;



while 30.0 < temperature
    [arrivaltime_index_temp,airplaneST_temp,flag]=exchange2(gate,arrivaltime_index,airplaneST);
    if flag==1
        [cost_temp,nogate_passenger_temp]=calcu_cost(airplane_departure_arrival_DI,airplaneST_temp,arrivaltime_index);
        diff=cost_temp-previous_cost;
            if diff < 0 || (rand < exp(-diff/temperature))
                cost=min(cost_temp,cost);
                if cost==cost_temp
                    best_arrenge=airplaneST_temp;
                    nogate_passenger=nogate_passenger_temp;
                end
                previous_cost=cost_temp;
                arrivaltime_index = arrivaltime_index_temp;
                airplaneST=airplaneST_temp;
                % update iterations
                temperature_iterations = temperature_iterations + 1;
                plot_iterations = plot_iterations + 1;
                iterations = iterations + 1;
            end
            if temperature_iterations >= 100
                temperature = cooling_rate*temperature;
                temperature_iterations = 0;
            end
    end
        %  ���nogate
    if plot_iterations >= 20
       ['temperature��' num2str(temperature)];
       cost
       nogate_passenger
       plot_iterations = 0;
    end
end
best_arrenge


