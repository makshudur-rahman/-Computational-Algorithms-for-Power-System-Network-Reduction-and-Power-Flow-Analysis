clc;
clear all;
a= [400,230;110,66;33,22;11,6.6;0.4,0.23];
fprintf('1:Primary Transmission\n2:Primary Distribution\n3: Secondary Transmission\n4:Secondary Distribution\n5:Tertiary Distribution\n\n')
b=input('Enter the serial number:');
fprintf('Line voltage: %f KV\n Phase Voltage: %f KV\n',a(b,1),a(b,2))