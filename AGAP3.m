function airplaneST_plusRigion=AGAP3
clear all
clc
t0 = clock;
filename = 'pucks1.txt';
fid = fopen(filename,'r');
tline = fgetl(fid); 
airline_info=cell(303,3);
ind=1;
while ischar(tline)
    data = regexp(tline,  ' ', 'split');
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

[nogate,airplane2gate,arrivaltime_index,gate]=AGAP1();%根据第一题的算法生成初始解
global walktime_matrix
walktime_matrix=[10 15 20 25 20 25 25
    15 10 15 20 15 20 20
    20 15 10 25 20 25 25
    25 20 25 10 15 20 20
    20 15 20 15 10 15 15
    25 20 25 20 15 10 20
    25 20 25 20 15 20 10];
global matrix_airline
matrix_airline=zeros(303,303);
matrix_airline=bulidmatrix(matrix_airline,passenger_info,airline_info);%构建乘客的降落飞机到出发飞机的人数矩阵
connect_time=connect_time_calcu(arrivaltime_index);
gate_expand=zeros(length(airplane2gate(:,1)),1);
gate_expand2=zeros(length(airplane2gate(:,1)),1);
airplaneST_plusRigion=[airplane2gate gate_expand gate_expand2];
airplaneST_plusRigion=isST_plusregion(airplaneST_plusRigion,gate);%根据飞机分配登机口确定其ST属性
airplane_departure_arrival_DI=isDI(arrivaltime_index);%确定飞机的起飞降落的国内国际属性，输出成矩阵形式
%退火算法
temperature = 100;                 % 初始温度
cooling_rate = 0.94;                % 冷却率
iterations = 1;                     % 迭代次数
temperature_iterations = 1;
plot_iterations = 1;
passenger_change_time=calcu_time3(airplane_departure_arrival_DI,airplaneST_plusRigion);
cost=sum(passenger_change_time./connect_time);
previous_cost=cost;
best_arrenge=airplaneST_plusRigion;
while 10.0 < temperature
    [arrivaltime_index_temp,airplaneST_plusRigion_temp,flag]=exchange2(gate,arrivaltime_index,airplaneST_plusRigion);
    if flag==1
        passenger_change_time_temp=calcu_time3(airplane_departure_arrival_DI,airplaneST_plusRigion);
        cost_temp=sum(passenger_change_time_temp./connect_time);
        diff=cost_temp-previous_cost;
            if diff < 0 || rand < exp(-diff/temperature)
                cost=min(cost_temp,cost);
                if cost==cost_temp
                    best_arrenge=airplaneST_plusRigion_temp;
                    best_passenger_change_time=passenger_change_time_temp;
                    best_intense=passenger_change_time_temp./connect_time;
                end
                previous_cost=cost_temp;
                arrivaltime_index = arrivaltime_index_temp;
                airplaneST_plusRigion=airplaneST_plusRigion_temp;
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
        %  输出nogate
    if plot_iterations >= 200
       ['temperature：' num2str(temperature)];
        cost
       plot_iterations = 0;
       Time_Cost=etime(clock,t0);
    end
end
best_arrenge
best_passenger_change_time
best_intense