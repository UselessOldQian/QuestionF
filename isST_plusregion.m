function airplaneST_plusRigion=isST_plusregion(airplaneST_plusRigion,gate)
for i=1:length(airplaneST_plusRigion(:,1))
    if airplaneST_plusRigion(i,2)==0%δ����ǻ��ڷɻ����迼��
        airplaneST_plusRigion(i,3)=0;
        continue
    end
    if airplaneST_plusRigion(i,2)>100
        if floor(airplaneST_plusRigion(i,2)/200)==0 %���1��ͷ�ĵǻ���ΪS
            airplaneST_plusRigion(i,3)=1;
        else
            airplaneST_plusRigion(i,3)=2; %���2��ͷ�ĵǻ���ΪT
        end
    else
        if floor(airplaneST_plusRigion(i,2)/20)==0
            airplaneST_plusRigion(i,3)=1;
        else
            airplaneST_plusRigion(i,3)=2;
        end
    end
    gate_name=airplaneST_plusRigion(i,2);
    airplaneST_plusRigion(i,4)=gate(find(gate(:,1)==gate_name),5);
end