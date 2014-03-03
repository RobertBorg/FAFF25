function generateTriangleWave(numTerms)
	curve = 'y = ';
	for m = 1:numTerms
		if mod(m,2) == 1
			if mod(m,4) == 1
				b = 1/(m*m);
			else
				b = -1/(m*m);
			end
		else
			b = 0;
		end

		if m == 1
			curve = strcat(curve,num2str(b),'*sin(', num2str(m), '*t)');
		else
			curve = strcat(curve, '+ ',num2str(b),'*sin(', num2str(m), '*t)');
		end
	end
	curve = strcat(curve, ';');
	t = [0:0.001:4*pi];
	eval(curve);
	figure
	plot(t,y);
end
