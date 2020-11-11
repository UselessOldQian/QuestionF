function can_insert=compatibility(air_type,gate_type)
can_insert=0;
str_air_type=num2str(air_type);
str_gate_type=num2str(gate_type);
if sum(str_air_type(:,1)==str_gate_type(1))==size(str_air_type,1)
   if str_gate_type(2)=='3' || sum(str_air_type(:,2)==str_gate_type(2))==size(str_air_type,1)
       if str_gate_type(3)=='3' || sum(str_air_type(:,3)==str_gate_type(3))==size(str_air_type,1)
           can_insert=1;
       end
   end
end