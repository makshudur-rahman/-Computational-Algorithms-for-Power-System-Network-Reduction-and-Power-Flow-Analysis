clc, 
clear all, 
close all;

%input ('Enter Digital Input Information = '); 
x= [1 0 1 0 0 0 1 1 0];
Tb = 0.0001;
N = length (x); 
Disp ('Binary Input Information at Transmitter: ');
Disp (x);
 
nb = 100;

digit = [];
for n = 1:1:N
if x(n) == 1;
sig =ones(1,nb); 
else x(n) == 0;
sig = zeros (1, nb);
end
digit = [digit sig]; 
    end
t1 = Tb/nb: Tb/nb: nb*N* (Tb/nb) ;
figure ('Name', 'Line Coding Schemes', NumberTitle', 'off' ) ; 
plot (t1, digit, 'LineWidth',2.5);
axis ([0 Tb*N -0.5 1.5]);
xlabel('Time (Sec)');
ylabel('Amplitude (Volts)');
title('Digital Input Signal');