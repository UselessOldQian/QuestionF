function replace_gateindex=code_match(type_airplane,gate)
replace_gateindex=find(gate(:,2)==type_airplane);
str_gate_code=num2str(type_airplane);
str_gate_code2=str_gate_code;
str_gate_code3=str_gate_code;
str_gate_code4=str_gate_code;
str_gate_code2(2)='3';
str_gate_code3(3)='3';
str_gate_code4(2:3)='33';
type2=str2num(str_gate_code2);
type3=str2num(str_gate_code3);
type4=str2num(str_gate_code4);
replace_gateindex2=find(gate(:,2)==type2);
replace_gateindex3=find(gate(:,2)==type3);
replace_gateindex4=find(gate(:,2)==type4);
replace_gateindex=[replace_gateindex
    replace_gateindex2
    replace_gateindex3
    replace_gateindex4];
    