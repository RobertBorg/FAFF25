function enkelspalt(num, screenWidth, L)
	%setup
	spaltWidth = 100*10^-6;
	spaltSegmentWidth = spaltWidth/num
	spaltSegmentStartPos = spaltSegmentWidth/2;
	spaltSegmentEndPos = spaltWidth - spaltSegmentStartPos;

	screenSegmentWidth = screenWidth/num
	screenSegmentStartPos = screenSegmentWidth;
	screenSegmentEndPos = screenWidth;

	screenSpaltDiff = spaltWidth/2;
	spaltSegmentIntensity = 1 / num;
	A = 632*10^-9;
	k = 2*pi/(A);


	n =0; % counter för debugutskrift
	screen = []; % init

	for screenPos = screenSegmentStartPos:screenSegmentWidth:screenSegmentEndPos
		screenIntensity = 0; % för att summera från alla segment
		for spaltPos = spaltSegmentStartPos:spaltSegmentWidth:spaltSegmentEndPos
			if(mod(n, 1000000) == 0)
				disp(['n is ', num2str(n), 'screenPos is ', num2str(screenPos), 'spaltPos is ', num2str(spaltPos)]) % debug
			end
			x = sqrt(((screenSpaltDiff + screenPos) - spaltPos)^2 + L^2); % vägen som strålen har gått
			screenIntensity = screenIntensity + spaltSegmentIntensity * sin(-k*x); % summera
			n = n + 1;
		end
		screen(end + 1) = abs(screenIntensity); % absolutbelopp då vi är intresserade av intensiteten och inte amplituden
	end


	

	figure
	plot(screenSegmentStartPos:screenSegmentWidth:screenSegmentEndPos, screen)
	title(strcat(['Fresneldiffraktion för L=',num2str(L),' med skärmbredd ', num2str(screenWidth)]),'FontSize',15);
	xlabel('x(m)');
	ylabel('I (%)');

	screen = [];

	%%enl sid 319 i boken
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