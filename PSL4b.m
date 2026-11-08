clc;
clear;
z = [ Inf+0.000i, 0.02+0.04i, 0.01+0.03i;
      0.02+0.04i, Inf+0.000i, 0.0125+0.025i;
      0.01+0.03i, 0.0125+0.025i, Inf+0.000i];
[m, n] = size(z);
fprintf('Impedance matrix z:');
z
% Inverting the elements of z matrix
for p = 1:m
    for j = 1:n
        if z(p, j) == Inf
            y(p, j) = 0;
        else
            y(p, j) = 1 / z(p, j);
        end
    end
end
fprintf('Admittance matrix y:');
y
% Constructing the Y-bus matrix
for p = 1:m
    for d = 1:n
        if p == d
            s = 0;
            for k = 1:n
                s = s + y(p, k);
            end
            Y(p, d) = s;
        else
            Y(p, d) = -y(p, d);
        end
    end
end

fprintf('Y bus matrix:');
Y
v1 = 1.05 + 0i;
v2(1) = 1 + 0i;
v3(1) = 1 + 0i;
p2 = 256.6 + 110.2i;
p3 = 138.6 + 45.2i;
base = 100;
s2 = -(p2 / base);
s3 = -(p3 / base);

disp('Iteration          v2              v3')
for k = 1:20
    v2(k + 1) = (((real(s2) - 1i * imag(s2)) / conj(v2(k))) - Y(2, 1) * v1 - Y(2, 3) * v3(k)) / Y(2, 2);
    m = v2(k + 1);
    v3(k + 1) = (((real(s3) - 1i * imag(s3)) / conj(v3(k))) - Y(3, 1) * v1 - Y(3, 2) * v2(k + 1)) / Y(3, 3);
    n = v3(k + 1);
    if abs(v2(k + 1) - v2(k)) < .00001 && abs(v3(k + 1) - v3(k)) < .00001
        break
    end
    fprintf('\t%d\t', k), disp([m, n])
end
fprintf('Final calculated voltages after Gauss Seidel iteraion:')
v2_final = m
v3_final = n