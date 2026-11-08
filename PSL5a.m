clc;
clear;

va = [50 0];
vb = [20 90];
vc = [10 80];

vabc = [va; vb; vc];

mag = vabc(:,1);
ang = pi / 180 * vabc(:,2);

vabcr = mag .* (cos(ang) + 1j * sin(ang));

a = cos(2 * pi / 3) + 1j * sin(2 * pi / 3);

A = [1 1 1; 1 a^2 a; 1 a a^2];

va012 = inv(A) * vabcr;
vabc0 = va012(1) * [1; 1; 1];
vabc1 = va012(2) * [1; a^2; a]; 
vabc2 = va012(3) * [1; a; a^2];
vabc1(1)
vabc1(2)
vabc1(3)
figure;
subplot(1,4,1);
phasor([vabcr]);
title('Original Phasors');
subplot(1,4,2);
phasor([vabc0]);
title('Zero Sequence');
subplot(1,4,3);
phasor([vabc1]);
title('Positive Sequence');
subplot(1,4,4);
phasor([vabc2]);
title('Negative Sequence');