function [cost,nogate_passenger]=calcu_cost(airplane_departure_arrival_DI,airplaneST,arrivaltime_index)
global matrix_airline;
global p
[x,y]=find(matrix_airline>0);
cost_unit=0;
[wait_time_matrix,cant_catch_matrix ]=calcu_wait_time(airplaneST,arrivaltime_index);
nogate_passenger=sum((wait_time_matrix==0).*p);
cost=nogate_passenger*9999999;
for i = 1:size(x,1)%����ɻ�
    cost_unit=0;
    arriveST=airplaneST(x(i),3);%����ɻ���ST����
    arriveDI=airplane_departure_arrival_DI(x(i),1);%����ɻ���DI����
    departureST=airplaneST(y(i),3);%�뿪�ɻ���ST����
    departureDI=airplane_departure_arrival_DI(y(i),2);%�뿪�ɻ���DI����
    if arriveST==2 & arriveDI==1 & departureST==2 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*15;
    end
    if arriveST==2 & arriveDI==1 & departureST==1 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*20;
    end
    if arriveST==2 & arriveDI==1 & departureST==2 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*35;
    end
    if arriveST==2 & arriveDI==1 & departureST==1 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*40;
    end
    if arriveST==1 & arriveDI==1 & departureST==2 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*20;
    end
    if arriveST==1 & arriveDI==1 & departureST==1 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*15;
    end    
    if arriveST==1 & arriveDI==1 & departureST==2 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*40;
    end
    if arriveST==1 & arriveDI==1 & departureST==1 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*35;
    end
    if arriveST==2 & arriveDI==2 & departureST==2 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*35;
    end
    if arriveST==2 & arriveDI==2 & departureST==1 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*40;
    end
    if arriveST==2 & arriveDI==2 & departureST==2 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*20;
    end
    if arriveST==2 & arriveDI==2 & departureST==1 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*30;
    end   
    if arriveST==2 & arriveDI==1 & departureST==2 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*40;
    end    
    if arriveST==2 & arriveDI==1 & departureST==1 & departureDI==1
        cost_unit=matrix_airline(x(i),y(i))*45;
    end  
    if arriveST==2 & arriveDI==1 & departureST==2 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*30;
    end
    if arriveST==2 & arriveDI==1 & departureST==1 & departureDI==2
        cost_unit=matrix_airline(x(i),y(i))*20;
    end   
    cost=cost+cost_unit;
end