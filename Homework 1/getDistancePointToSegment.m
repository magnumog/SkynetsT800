function distance = getDistancePointToSegment(q,p1,p2)

[a,b,c] = getLineThroughTwoPoints(p1,p2);

%Ortogonal projection of q on the line through two points p1 and p2
QPx=(b^2*q(1) - a*b*q(2) - a*c)/sqrt(a^2+b^2);
QPy=(-a*b*q(1) + a^2*q(2) - b*c)/sqrt(a^2+b^2);

% Find the distance from the ortogonal projection to the points p1 and p2
% and add them together then if the projection is on the line between the
% points p1 and p2 the distance should be the same as the distance from p1
% to p2. If not find the distance from q to the which of the points p1 or
% p2 whom it is closest.
if((dist([QPx,QPy],p1)+dist([QPx,QPy],p2)) == dist(p1,p2))
    distance = getDistancePointToline(q,p1,p2);
else
    distOne=dist(q,p1);
    distTwo=dist(q,p2);
    distance = min(distOne,distTwo);
end