clc;
clear;
close all;

Y = [-9.8i 0 4j 5j; 0 -8.3i 2.5i 5i; 4i 2.5i -14.5i 8i; 5i 5i 8i -18i];
fprintf("Main Matrix: ")
Y
n = input("Enter the number of reduction: ");
s = 4

for p=1:n
    for k=1:s
        for j=1:s
            Y(k,j) = Y(k,j) - ((Y(k,s)*Y(s,j))/Y(s,s));
        end
    end
    fprintf("using equations:")
    Y
      X=Y;
    clear Y;
    
    for i=1:s-1
        for j=1:s-1
            Y(i,j)=X(i,j);
        end
    end
    fprintf("Output: ")
    Y
    s=s-1;
end