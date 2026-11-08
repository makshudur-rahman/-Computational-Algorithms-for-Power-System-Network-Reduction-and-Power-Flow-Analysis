clc;
clear all;
z = [ Inf+0.000i, 0.02+0.04i, 0.01+0.03i;
    0.02+0.04i, Inf+0.000i, 0.0125+0.025i;
    0.01+0.03i, 0.0125+0.025i, Inf+0.000i;];


fprintf('z Matrix')
z
for a=1:3
    for b=1:3
        y(a,b)=1/z(a,b);
      
    end
end

fprintf('y Matrix')
y
for a=1:3
    for b=1:3
        if a==b
            sum=0;
            for j=1:3
                sum=sum+y(a,j);
                Y(a,b)=sum;
            end
        else
            Y(a,b)=-y(a,b);
        end
    end
end
fprintf('Y is Bus Admittance Matrix')
Y
v1 = 1.05 + 0i;
v2(1) = 1;
v3(1) = 1;


p2 = -256.6;
q2 = -110.2i;
p3 = -138.6;
q3 = -45.2i;
base = 100;
P2 = p2 / base;
Q2 = q2 / base;
P3 = p3 / base;
Q3 = q3 / base;


for k = 1:20
    v2(k+1) = (P2 - Q2 / v2(k) - Y(2,1) * v1 - Y(2,3) * v3(k)) / Y(2,2);
    M(k) = v2(k+1);
    v3(k+1) = (P3 - Q3 / v3(k) - Y(3,1) * v1 - Y(3,2) * v2(k+1)) / Y(3,3);
    N(k) = v3(k+1);
    
    if k > 1
        if abs(M(k) - M(k-1)) <= 0.0001 && abs(N(k) - N(k-1)) <= 0.0001
            break;
        end
    end
    
    fprintf('Iteration %d: v2 = %f + %fi, v3 = %f + %fi\n', k, real(v2(k+1)), imag(v2(k+1)), real(v3(k+1)), imag(v3(k+1)));
end