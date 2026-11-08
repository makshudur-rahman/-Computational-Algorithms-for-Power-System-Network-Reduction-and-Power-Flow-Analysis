clc;
clear all;
close all;
y=[-9.8i,0,4i,5i; 
    0,-8.3i,2.5i,5i;
    4i,2.5i,-14.5i,8i; 
    5i,5i,8i,-18i];
[a1,b1] = size(y)
r = a1
c=1
while( c>=1 )
    x = input(" Do you wanna eliminate?(1/0)");
    if (x==1)
        
        c=c+1;
        if(c<=r)
            n = input("Give The Number of node: ")
            for a = 1:a1-1
            for b = 1:b1-1
                y(a,b) = y(a,b) - ((y(a,n)*y(n,b))/y(n,n));
        end
            end 
        else 
            fprintf("Can't reduce more :( ")
            break
        end

          
    else
        break   
    end
a1 = a1 - 1;
b1 = b1 - 1;
y(n,:) = [];
y(:,n) = [];
end
y