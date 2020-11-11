function airplane_departure_arrival_DI=isDI(arrivaltime_index)%确定飞机的起飞降落的国内国际属性，输出成矩阵形式
strDI=num2str(arrivaltime_index(:,5));
airplane_departure_arrival_DI=zeros(length(arrivaltime_index(:,1)),2);
airplane_departure_arrival_DI(:,1)=str2num(strDI(:,2));
airplane_departure_arrival_DI(:,2)=str2num(strDI(:,3));