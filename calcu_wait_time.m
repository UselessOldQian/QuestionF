function [wait_time_matrix,cant_catch_matrix ]=calcu_wait_time(airplaneST,arrivaltime_index)%��ȡ�˿͸ϳ�ʱ����Ƿ��ܸ��Ϸɻ�����
global airplane_departure_arrival_DI;
global matrix_airline;
[x,y]=find(matrix_airline>0);
wait_time_matrix=zeros(size(x,1),1);
cant_catch_matrix=zeros(size(x,1),1);
for i = 1:size(x,1)%����ɻ�
    arriveST=airplaneST(x(i),3);%����ɻ���ST����
    arriveDI=airplane_departure_arrival_DI(x(i),1);%����ɻ���DI����
    departureST=airplaneST(y(i),3);%�뿪�ɻ���ST����
    departureDI=airplane_departure_arrival_DI(y(i),2);%�뿪�ɻ���DI����
    difftime=(arrivaltime_index(y(i),3)-arrivaltime_index(x(i),2))*60*24+45;%�˿ͽ���ɻ��ͳ����ɻ���ʱ���
    if arriveST==2 & arriveDI==1 & departureST==2 & departureDI==1
        wait_time_matrix(i)=15;
    end
    if arriveST==2 & arriveDI==1 & departureST==1 & departureDI==1
        wait_time_matrix(i)=20;
    end
    if arriveST==2 & arriveDI==1 & departureST==2 & departureDI==2
        wait_time_matrix(i)=35;
    end
    if arriveST==2 & arriveDI==1 & departureST==1 & departureDI==2
        wait_time_matrix(i)=40;
    end
    if arriveST==1 & arriveDI==1 & departureST==2 & departureDI==1
        wait_time_matrix(i)=20;
    end
    if arriveST==1 & arriveDI==1 & departureST==1 & departureDI==1
        wait_time_matrix(i)=15;
    end    
    if arriveST==1 & arriveDI==1 & departureST==2 & departureDI==2
        wait_time_matrix(i)=40;
    end
    if arriveST==1 & arriveDI==1 & departureST==1 & departureDI==2
        wait_time_matrix(i)=35;
    end
    if arriveST==2 & arriveDI==2 & departureST==2 & departureDI==1
        wait_time_matrix(i)=35;
    end
    if arriveST==2 & arriveDI==2 & departureST==1 & departureDI==1
        wait_time_matrix(i)=40;
    end
    if arriveST==2 & arriveDI==2 & departureST==2 & departureDI==2
        wait_time_matrix(i)=20;
    end
    if arriveST==2 & arriveDI==2 & departureST==1 & departureDI==2
        wait_time_matrix(i)=30;
    end   
    if arriveST==2 & arriveDI==1 & departureST==2 & departureDI==1
        wait_time_matrix(i)=40;
    end    
    if arriveST==2 & arriveDI==1 & departureST==1 & departureDI==1
        wait_time_matrix(i)=45;
    end  
    if arriveST==2 & arriveDI==1 & departureST==2 & departureDI==2
        wait_time_matrix(i)=30;
    end
    if arriveST==2 & arriveDI==1 & departureST==1 & departureDI==2
        wait_time_matrix(i)=20;
    end   
    if difftime<=wait_time_matrix(i)
        cant_catch_matrix(i)=1;
    end
end
