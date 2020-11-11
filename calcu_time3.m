function passenger_change_time=calcu_time3(airplane_departure_arrival_DI,airplaneST_plusRigion)
global walktime_matrix;
global matrix_airline;
[x,y]=find(matrix_airline>0);
passenger_change_time=zeros(size(x,1),1);
for i = 1:size(x,1)%到达飞机
    walk_time=0;
    cost_unit=0;
    cart_time=0;
    arriveST=airplaneST_plusRigion(x(i),3);%到达飞机的ST属性
    arriveDI=airplane_departure_arrival_DI(x(i),1);%到达飞机的DI属性
    departureST=airplaneST_plusRigion(y(i),3);%离开飞机的ST属性
    departureDI=airplane_departure_arrival_DI(y(i),2);%离开飞机的DI属性
    arriveRigion=airplaneST_plusRigion(x(i),4);
    departureRigion=airplaneST_plusRigion(y(i),4);
    if arriveRigion==0||departureRigion==0
        passenger_change_time(i)=0;
        continue
    end
    walk_time=walktime_matrix(arriveRigion,departureRigion)*matrix_airline(x(i),y(i));
    
    if arriveST==2 & arriveDI==1 & departureST==2 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*15;
        cart_time=0;
    end
    if arriveST==2 & arriveDI==1 & departureST==1 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*20;
        cart_time=3;
    end
    if arriveST==2 & arriveDI==1 & departureST==2 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*35;
        cart_time=0;
    end
    if arriveST==2 & arriveDI==1 & departureST==1 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*40;
        cart_time=3;
    end
    if arriveST==1 & arriveDI==1 & departureST==2 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*20;
        cart_time=3;
    end
    if arriveST==1 & arriveDI==1 & departureST==1 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*15;
        cart_time=0;
    end    
    if arriveST==1 & arriveDI==1 & departureST==2 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*40;
        cart_time=3;
    end
    if arriveST==1 & arriveDI==1 & departureST==1 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*35;
        cart_time=0;
    end
    if arriveST==2 & arriveDI==2 & departureST==2 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*35;
        cart_time=0;
    end
    if arriveST==2 & arriveDI==2 & departureST==1 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*40;
        cart_time=3;
    end
    if arriveST==2 & arriveDI==2 & departureST==2 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*20;
        cart_time=0;
    end
    if arriveST==2 & arriveDI==2 & departureST==1 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*30;
        cart_time=3;
    end   
    if arriveST==2 & arriveDI==1 & departureST==2 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*40;
        cart_time=3;
    end    
    if arriveST==2 & arriveDI==1 & departureST==1 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*45;
        cart_time=6;
    end  
    if arriveST==2 & arriveDI==1 & departureST==2 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*30;
        cart_time=3;
    end
    if arriveST==2 & arriveDI==1 & departureST==1 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*20;
        cart_time=0;
    end
    cart_time=cart_time*matrix_airline(x(i),y(i));
    passenger_change_time(i)=cost_unit+cart_time+walk_time;
end 


