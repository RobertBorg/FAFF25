A = 0.4:0.001:0.7; % våglängsdintervall

%konstanter
a1 = 2.271176;
a2 = -9.700709 * 10^-3;
a3 = 0.0110971;
a4 = 4.622809*10^-5;
a5 = 1.616105*10^-5;
a6 = -8.285043*10^-7;

%delresultat för läslighet
A2 = A.^2
A4 = A.^4
A6 = A.^6
A8 = A.^8

n = sqrt(a1 + a2 .* A2 + a3./A2 + a4./A4 + a5./A6 + a6./A8) % n enl formel
figure
plot(A,n)
xlabel('våglängd(micrometer)')
ylabel('n(våglängd)')