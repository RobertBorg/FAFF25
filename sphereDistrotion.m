function sphereDistortion()
	R = 0.15
	n1 = 1
	n2 = 1.5
	h = 0:0.00001:0.05;
	T = asin(h./R); %infallsvinkel
	L = asin(sin(T) ./ n2) % utfallsvinkel
	focal = pi - (pi - T) - L;
	diff = R * sin(L)./ sin(focal) + R;
	a = n2 * R ./ (n2-n1)
	figure
	plot(h, diff, h, a)
	ylabel('f(h)')
	xlabel('h')
end
