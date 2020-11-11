function matrix_airline=bulidmatrix(matrix_airline,passenger_info,airline_info)%构建乘客的降落飞机到出发飞机的人数矩阵
for i=1:length(passenger_info(:,1))
    [ismem,arrive_x]=ismember(cell2mat(passenger_info(i,2)),airline_info(:,2));%根据乘客的降落航班查找其飞机
    if ismem==0
        %['arrive_x not exist:' cell2mat(passenger_info(i,2))]
        continue;
    end
    [ismem1,departure_y]=ismember(cell2mat(passenger_info(i,3)),airline_info(:,3));%根据乘客的起飞航班查找其飞机
    if ismem1==0
        %['departure_y not exist:' cell2mat(passenger_info(i,3))]
        continue;
    end
    matrix_airline(arrive_x,departure_y)=matrix_airline(arrive_x,departure_y)+str2num(cell2mat(passenger_info(i,1)));
end