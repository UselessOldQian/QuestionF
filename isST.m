function airplaneST=isST(airplaneST)%���ݷɻ�����ǻ���ȷ����ST����
for i=1:length(airplaneST(:,1))
    if airplaneST(i,2)==0%δ����ǻ��ڷɻ����迼��
        airplaneST(i,3)=0;
        continue
    end
    if airplaneST(i,2)>100
        if floor(airplaneST(i,2)/200)==0 %���1��ͷ�ĵǻ���ΪS
            airplaneST(i,3)=1;
        else
            airplaneST(i,3)=2; %���2��ͷ�ĵǻ���ΪT
        end
    else
        if floor(airplaneST(i,2)/20)==0
            airplaneST(i,3)=1;
        else
            airplaneST(i,3)=2;
        end
    end
end