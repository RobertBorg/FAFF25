function chromaticDistortion()
	R = 0.15
	n1 = 1
	A = 0.4:0.001:0.7;
	a1 = 2.271176;
	a2 = -9.700709 * 10^-3;
	a3 = 0.0110971;
	a4 = 4.622809*10^-5;
	a5 = 1.616105*10^-5;
	a6 = -8.285043*10^-7;
	A2 = A.^2
	A4 = A.^4
	A6 = A.^6
	A8 = A.^8
	n2 = sqrt(a1 + a2 .* A2 + a3./A2 + a4./A4 + a5./A6 + a6./A8)
	h = 0.05;
	T = asin(h./R); %infallsvinkel
	L = asin(sin(T) ./ n2) % utfallsvinkel
	focal = pi - (pi - T) - L;
	diff = R * sin(L)./ sin(focal) + R;
	a = n2 * R ./ (n2-n1)
	figure
	plot(A, diff, A, a)
	ylabel('f(våglängd) vid h = 5 cm')
	xlabel('våglängd')
end
