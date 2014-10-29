function [u_x, u_y] = computeTangentVectorToPolygon(q, P)

tolerance=0.01;
q_x = q(1);
q_y = q(2);

%closest distance and point to q
distance = -1;
closestPoint=[0,0;0,0];

calcDist=0;
for i=1:length(P)
    calcDist = getdistancePointToSegment(q,P(i,:),P(i+1,:));
    if(calcDist<distance || distance<0)
        distance=calcDist;
        closestPoint(1,:) = P(1,:);
        closestPoint(2,:) = P(2,:);
    end
end

%Calculate if there is a segmet which is closing the polygon
if(any(P(end,:) ~= P(1,:)))
    calcDist=getDistancePointToSegment(q,P(end,:),P(1,:));
    if(calcDist < distance || distance <0)
        distance=calcDist;
        closestPoint(1,:) = P(end,:);
        closestPoint(2,:) = P(1,:);
    end
end

%Think of a better way to do this
pointOne = closestPoint(1,:);
pointTwo = closestPoint(2,:);
[a,b,c] = getLineThroughTwoPoints(pointOne,pointTwo);

orto_x=(b^2*q_x-a*b*q_y-a*c)/sqrt(a^2+b^2);
orto_y=(-a*b*q_x+a^2*q_y-b*c)/sqrt(a^2+b^2);

% boolOnX= orto_x>=min(pointOne(1),pointTwo(1)) && orto_x<=max(pointOne(1),pointTwo(1));
% boolOnY= orto_y>=min(pointOne(2),pointTwo(2)) && orto_y<=max(pointOne(2),pointTwo(2));

u_x=1;
u_y=1;
moveToPoint=[0 0];

%if((boolOnY && boolOnX))
if((getDistancePointToline(q,pointOne,pointTwo)>getDistancePointToSegment(q,pointOne,pointTwo)))
    u_x = pointOne(1)-pointTwo(1);
    u_y = pointOne(2)-pointTwo(2);
else
    if(sqrt((pointOne(1)-q_x)^2+(pointOne-q_y)^2)>distance+tolerance)
        moveToPoint = pointTwo;
    end
    x=(q_x-moveToPoint(1));
    y=(q_y-moveToPoint(2));
    u_x=-y;
    u_y=x;
end
% Uncomment the following lines to display debug plot
% figure;
% hold on
% fill(P(:,1),P(:,2),'k')
% plot(q(1),q(2),'ob');
% plot([q(1), q(1) + u_x],[q(2), q(2) + u_y],'-b');
% axis square
% hold off;
end