function [gateindex,gate,arrivaltime_index,airplane2gate]=insert_new(availablegate,gate,arrivaltime_index,airplaneindex,airplane2gate)%确定飞机停靠哪个登机口
gateindex=0;
for i=1:length(availablegate)
    available_plane_index=find(airplane2gate(:,2)==gate(availablegate(i),1));
    available_plane_index_sort=sort(arrivaltime_index(available_plane_index,3));
    for j=1:length(available_plane_index)
        if arrivaltime_index(airplaneindex,2)>=arrivaltime_index(available_plane_index(j),6) & ...
                arrivaltime_index(airplaneindex,3)<=arrivaltime_index(available_plane_index(j),2)
            airplane2gate(airplaneindex,2)=gate(availablegate(i),1);
            gateindex=gate(availablegate(i),1);
            arrivaltime_index(airplaneindex,6)=arrivaltime_index(available_plane_index(j),6);
            arrivaltime_index(airplaneindex,7)=arrivaltime_index(available_plane_index(j),2);
            arrivaltime_index(available_plane_index(j),6)=arrivaltime_index(airplaneindex,3);
            if j>1
                arrivaltime_index(available_plane_index(j-1),7)=arrivaltime_index(airplaneindex,2);
            end
            return
        end
    end
end