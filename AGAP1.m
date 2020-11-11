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
arrivaltime=datenum(y,m,data(:,2),data(:,3),data(:,4),s);%����ʱ��
leavetime=datenum(y,m,data(:,5),data(:,6),data(:,7),s)+45/1440;%����ʱ��
duration=(leavetime-arrivaltime)*24*60;
previoustime=zeros(size(duration,1),1);
latertime=zeros(size(duration,1),1)+999;
arrivaltime_index=[data(:,1),arrivaltime,leavetime,duration,data(:,8),previoustime,latertime];%���ɷɻ���ţ�����ʱ�䣬���ʱ�䣬����ʱ��͹��ڹ����Լ���խ����,ǰһ�ɻ����ʱ��(+45����)�ͺ�һ�ɻ���½ʱ��
[airplane2gate,arrivaltime_index,gate]=greedyAl(arrivaltime_index,gate);%̰���㷨������ʼ��
nogate=sum(airplane2gate(:,2)==0)
gatenum=length(unique(airplane2gate(:,2)));
%�˻��㷨
temperature = 50;                 % ��ʼ�¶�
cooling_rate = 0.94;                % ��ȴ��
iterations = 1;                     % ��������
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
        %  ���nogate
    if plot_iterations >= 200
       ['temperature��' num2str(temperature)];%���
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







