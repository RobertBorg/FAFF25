function enkelspalt(num, screenWidth, L)
	spaltWidth = 100*10^-6;
	spaltSegmentWidth = spaltWidth/num
	spaltSegmentStartPos = spaltSegmentWidth/2;
	spaltSegmentEndPos = spaltWidth - spaltSegmentStartPos;
	%spaltSegment = spaltSegmentStartPos:spaltSegmentWidth:spaltSegmentEndPos;

	screenSegmentWidth = screenWidth/num
	screenSegmentStartPos = screenSegmentWidth;
	screenSegmentEndPos = screenWidth;
	%screenSegment = screenSegmentStartPos:screenSegmentWidth:screenSegmentEndPos;

	screenSpaltDiff = spaltWidth/2;
	spaltSegmentIntensity = 1 / num;
	A = 632*10^-9;
	k = 2*pi/(A);

	n =0;
	screen = [];

	for screenPos = screenSegmentStartPos:screenSegmentWidth:screenSegmentEndPos
		screenIntensity = 0;
		for spaltPos = spaltSegmentStartPos:spaltSegmentWidth:spaltSegmentEndPos
			if(mod(n, 1000000) == 0)
				disp(['n is ', num2str(n), 'screenPos is ', num2str(screenPos), 'spaltPos is ', num2str(spaltPos)])
			end
			x = sqrt(((screenSpaltDiff + screenPos) - spaltPos)^2 + L^2);
			screenIntensity = screenIntensity + spaltSegmentIntensity * sin(-k*x);
			n = n + 1;
		end
		screen(end + 1) = abs(screenIntensity);
	end


	

	figure
	plot(screenSegmentStartPos:screenSegmentWidth:screenSegmentEndPos, screen)
	title(strcat(['Fresneldiffraktion för L=',num2str(L),' med skärmbredd ', num2str(screenWidth)]),'FontSize',15);
	xlabel('x(m)');
	ylabel('I (%)');

	screen = [];
	for screenPos = screenSegmentStartPos:screenSegmentWidth:screenSegmentEndPos
		sintheta = (screenPos + screenSpaltDiff)/L % for small theta sin theta == tan theta
		beta = pi/A * spaltWidth * sintheta;
		screenIntensity = (sin(beta)/beta)^2;
		screen(end + 1) = screenIntensity;
	end

	

	figure
	plot(screenSegmentStartPos:screenSegmentWidth:screenSegmentEndPos, screen)
	title(strcat(['Fraunhoferdiffraktion, för L=',num2str(L),' med skärmbredd ', num2str(screenWidth)]),'FontSize',15);
	xlabel('x(m)');
	ylabel('I (%)');
end