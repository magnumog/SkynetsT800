function distance = computeDistancePointToPolygon(q,P)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if(ndims(P) ~=2 || size(P,1) < 4  || size(P,2) < 4)
    error('The polygon matrix is not in the right format, and number of points has to be >4')
end

%Find which segment is the closest from q in the polygon.
distance=getDistancePointToSegment(q,P(1,:),P(2,:));
for i=2:length(P)-1
    calcDist = getDistancePointToSegment(q,P(i,:),P(i+1,:));
    if(distance < calcDist)
        distance = calcDist;
    end
end

%In the case the polygon has an segment closing it
if(any(P(end,:) ~= P(1,:)))
    calDist = getDistancePointToSegment(q,P(end,:),P(1,:));
    if(distance>calDist)
        distance=calcDist;
    end
end
end

