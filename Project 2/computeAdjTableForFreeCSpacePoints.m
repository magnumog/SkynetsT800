function AdjTable = computeAdjTableForFreeCSpacePoints( freeCSpacePoints, maxAdjRadius )
    AdjTable = cell(size(freeCSpacePoints,1));
%     disp(AdjTable);
    temp = mod(freeCSpacePoints,2*pi);
    for i=1:size(freeCSpacePoints,1)
        for j=i+1:size(freeCSpacePoints,1)
            %calculate the dist between two points in clockwise direction
            distClockwisePointA = temp(i,1)-temp(j,1);
            distClockwisePointB = temp(i,2)-temp(j,2);
            
            %Calculate the dist between two points in counter clockwise
            %direction
            distCounterClockwisePointA = 2*pi-distClockwisePointA;
            distCounterClockwisePointB = 2*pi-distClockwisePointB;
            
            %Find the min distance between the two points
            x=min(distClockwisePointA,distCounterClockwisePointA);
            y=min(distClockwisePointB,distCounterClockwisePointB);
            
            if(sqrt(x.^2 + y.^2) <  maxAdjRadius)
                AdjTable{i} = [AdjTable{i},j];
                AdjTable{j} = [AdjTable{j},i];
            end
        end
        AdjTable{i}=AdjTable{i}';
    end
end