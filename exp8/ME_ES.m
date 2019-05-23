function [motionVect, EScomputations] = ME_ES(curFrame, refFrame, mbSize, dm, a)

	%   	curFrame : current frame
	%   	refFrame : reference frame
	%   	mbSize : MB size
	%   	dm : search window size
	% Ouput
	%   	motionVect : MV
	%   	EScomputations: full search cost
	curSlice = double(curFrame);
	refSlice = double(refFrame);

	[row, col] = size(curSlice);
	motionVect = zeros(2, row*col/(mbSize*mbSize)); %prealloc motion vector 
	blockCenter = zeros(2,row*col/(mbSize*mbSize)); %prealloc motion block center to draw vector
	cost = ones(2*dm+1, 2*dm+1)*(255+255)*mbSize;
	totalSearchScore = 0; % sum of search score
	mbCount = 1;
	for i = 1:mbSize:row-mbSize+1 %start row of the search, added by block number
		for j = 1:mbSize:col-mbSize+1 %start col of the search, added by block number
			for k = -dm:dm
				for l = -dm:dm
					refBlockRow = i + k; %start row of the search
					refBlockCol = j + l; %start col of the search
					if (refBlockRow < 1 || refBlockRow+mbSize-1>row)
						continue;
					end
					if (refBlockCol < 1 || refBlockCol+mbSize-1>col)
						continue;
					end
					cost(k+dm+1, l+dm+1) = costSAD(curSlice(i:i+mbSize-1,j:j+mbSize-1), refSlice(refBlockRow:refBlockRow +mbSize -1, refBlockCol:refBlockCol+mbSize-1));
					totalSearchScore = totalSearchScore + 1;
				end
			end
			blockCenter(1, mbCount) = i + mbSize/2 -1; %motion block center row
			blockCenter(2, mbCount) = j + mbSize/2 -1; %motion block center col
			[dx, dy] = minCost(cost); % find the block that has the smallest cost
			motionVect(1, mbCount) = dx - dm - 1; % motion vector row
			motionVect(2, mbCount) = dy - dm - 1; % motion vector col
			mbCount = mbCount + 1;
			cost = ones(2*dm+1, 2*dm+1)*(255+255)*mbSize;
		end
	end
	EScomputations = totalSearchScore/(mbCount-1);
	subplot(2,3,a);
	imshow(curFrame);
	title('motion vector pic');
	hold on;
	x = blockCenter(2, :); %col = x;
	y = blockCenter(1, :); %row = y;
	u = motionVect(2, : ); %motion col = u;
	v = motionVect(1, : ); %motion row = v;
	quiver(x, y, u, v, 'green');
	hold off;
end