function generateRecatangleWave(numTerms)
	curve = 'y = ';
	% bygg ekvation
	for m = 1:numTerms
		if mod(m,2) == 1
			b = 1/m;
		else
			b = 0;
		end

		if m == 1
			curve = strcat(curve,num2str(b),'*sin(', num2str(m), '*t)');
		else
			curve = strcat(curve, '+ ',num2str(b),'*sin(', num2str(m), '*t)');
		end
	end
	strcat(curve, ';');

	t = [0:0.001:4*pi];% ange intervall
	eval(curve); % evaluera ekvationen
	figure; % profit
	plot(t,y);
end
