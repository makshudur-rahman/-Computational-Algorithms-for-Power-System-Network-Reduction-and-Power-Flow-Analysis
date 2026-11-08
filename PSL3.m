clc;
clear;
n = 4;
Y = zeros(n, n); 

for i = 1:n
    for j = 1:n
        input1 = sprintf('Enter the value for Y(%d, %d): ', i, j);
        Y(i, j) = input(input1);
    end
end


fprintf("Input Matrix:\n");
disp(Y);


z = input("Enter the number of reductions: ");
for p = 1:z
    for k = 1:n
        for j = 1:n
            Y(k, j) = Y(k, j) - ((Y(k, n) * Y(n, j)) / Y(n, n));
        end
    end
    
    fprintf("After Reduction %d:\n", p);
    disp(Y);
    
    
    X = Y;
    clear Y;
    
    for i = 1:n-1
        for j = 1:n-1
            Y(i, j) = X(i, j);
        end
    end
    
    
    fprintf("Final output %d:\n", p);
    disp(Y);
    
    
    n = n - 1;
end