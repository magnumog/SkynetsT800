function distance = getDistancePointToline(q,p1,p2)
[a,b,c] = getLineThroughTwoPoints(p1,p2);

% A way to find the distance from q to the line without using the given
% dist function
%distance=abs(a*q(1)+b*q(2)+c)/sqrt(a^2+b^2);

% Calculates the ortogonal projection of q onto the line created by the two
% points p1 and p2.
QPx = (b^2*q(1) - a*b*q(2) - a*c)/sqrt(a^2+b^2);
QPy = (-a*b*q(1) + a^2*q(2) - b*c)/sqrt(a^2+b^2);

% gets the distance from the ortogonal projection to the point q.
distance = dist([QPx,QPy],q);


%disp(distance)
%disp(a)
%disp(b)
%disp(c)