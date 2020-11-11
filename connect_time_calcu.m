function connect_time=connect_time_calcu(arrivaltime_index)%计算航班的连接时间
global matrix_airline;
[x,y]=find(matrix_airline>0);
connect_time=zeros(size(x,1),1);
for i = 1:size(x,1)
    connect_time(i)=(arrivaltime_index(y(i),3)-arrivaltime_index(x(i),2))*60*24+45;%乘客降落飞机和出发飞机的时间差
    if connect_time(i)<= 0
        connect_time(i)=999999999;
    end
end