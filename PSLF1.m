clc;
clear;
close all;
% Taking user input for the matrix
Y = input('Enter the matrix (in the format of a complex matrix): ');
fprintf("Main Matrix: \n");
disp(Y);
% Taking user input for the number of reductions
n = input("Enter the number of reductions: ");
s = size(Y, 1); % Assuming the matrix is square
for p = 1:n
    for k = 1:s
        for j = 1:s
            Y(k, j) = Y(k, j) - ((Y(k, s) * Y(s, j)) / Y(s,s));
        end
    end
fprintf("After Reduction:\n");
disp(Y);

X = Y;
clear Y;
    for i = 1:s-1
        for j = 1:s-1
        Y(i, j) = X(i, j);
        end
    end
fprintf("Final Output: \n");
disp(Y);
s = s - 1;
end