function airplane_departure_arrival_DI=isDI(arrivaltime_index)%ȷ���ɻ�����ɽ���Ĺ��ڹ������ԣ�����ɾ�����ʽ
strDI=num2str(arrivaltime_index(:,5));
airplane_departure_arrival_DI=zeros(length(arrivaltime_index(:,1)),2);
airplane_departure_arrival_DI(:,1)=str2num(strDI(:,2));
airplane_departure_arrival_DI(:,2)=str2num(strDI(:,3));