function [nogate,airplane2gate,arrivaltime_index,gate]=AGAP1()
%clear all
%clc
data=xlsread('Input09.xlsx','Sheet1');
gate=xlsread('Input09.xlsx','Sheet4');
free_time=zeros(size(gate,1),1);
provious_airplaneindex=zeros(size(gate,1),1);
gate=[gate(:,1:2),free_time,provious_airplaneindex,gate(:,3)];
y=zeros(size(data,1),1);
m=zeros(size(data,1),1)+1;
s=zeros(size(data,1),1);
arrivaltime=datenum(y,m,data(:,2),data(:,3),data(:,4),s);%到达时间
leavetime=datenum(y,m,data(:,5),data(:,6),data(:,7),s)+45/1440;%出发时间
duration=(leavetime-arrivaltime)*24*60;
previoustime=zeros(size(duration,1),1);
latertime=zeros(size(duration,1),1)+999;
arrivaltime_index=[data(:,1),arrivaltime,leavetime,duration,data(:,8),previoustime,latertime];%生成飞机编号，到达时间，起飞时间，持续时间和国内国外以及宽窄属性,前一飞机起飞时间(+45分钟)和后一飞机着陆时间
[airplane2gate,arrivaltime_index,gate]=greedyAl(arrivaltime_index,gate);%贪婪算法产生初始解
nogate=sum(airplane2gate(:,2)==0)
gatenum=length(unique(airplane2gate(:,2)));
%退火算法
temperature = 50;                 % 初始温度
cooling_rate = 0.94;                % 冷却率
iterations = 1;                     % 迭代次数
previous_nogate=nogate;
temperature_iterations = 1;
plot_iterations = 1;
nogate_temp2=0;
while 20 < temperature
    [gate_temp,arrivaltime_index_temp,airplane2gate_temp]=exchange(gate,arrivaltime_index,airplane2gate);
    nogate=sum(airplane2gate_temp(:,2)==0);
    gatenum=length(unique(airplane2gate(:,2)));
    diff=nogate-previous_nogate;
    if (diff < 0) || (rand < exp(-diff/(temperature)))
        previous_nogate=nogate;
        gate = gate_temp;         %accept new  route
        arrivaltime_index = arrivaltime_index_temp;
        airplane2gate=airplane2gate_temp;

        % update iterations
        temperature_iterations = temperature_iterations + 1;
        plot_iterations = plot_iterations + 1;
        iterations = iterations + 1;
    end
    if temperature_iterations >= 100
        temperature = cooling_rate*temperature;
        temperature_iterations = 0;
    end
        %  输出nogate
    if plot_iterations >= 200
       ['temperature：' num2str(temperature)];%输出
       plot_iterations = 0;
       nogate;
    end
end
%for i =25:69
%    x=arrivaltime_index(i,2):0.1:arrivaltime_index(i,3);
%    y=ones(size(x))*airplane2gate(i,2);
%    plot(x,y,'b');
%    hold on
%end







