%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Intro to Robotics, ME170A/ECE181A, Spring 2009
% Joey Durham
% April 13, 2009
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Computes the free configuration space for a one link manipulator.

% The link is modeled as a rectangle with semi-circles attached to the
% ends, meaning it is specified by a length and a radius.
link1Length = 1.0;
link1Radius = 0.1;
link2Length = 1.0;
link2Radius = 0.1;

% The link is attached to a base at (0,0).
armBase = [0,0];

% To simplify the checks for collisions, the only obstacle in
% the workspace is a circle specified by a center and a radius.
circleCenter = [-1.0,-1.0];
circleRadius = 0.2;

numSamples = 100;
angleRange = linspace( -pi, pi, numSamples );

figure;
axis( [-pi pi -pi pi] )
hold on

for alpha = angleRange
    for beta = angleRange
        
        % The segment describing the link is defined by two points, armBase
        % and p1.
        p1 = armBase + [link1Length*cos(alpha), link1Length*sin(alpha)];
        p2 = p1 + [link2Length*cos(alpha + beta),link2Length*sin(alpha + beta)];   

        % To check that the link is not hitting the circle at this
        % value of alpha, it suffices to check that the distance
        % between the center of the circular obstacle and the segement
        % defining the link is greater than the sum of the radii.
        if( (getDistancePointToSegment(circleCenter,armBase,p1) < (link1Radius + circleRadius)) ) 
%             disp('du traff sirkelen link1');
            link1Plot = plot( alpha, beta, '.black', 'LineWidth', 3 );
        elseif( (getDistancePointToSegment(circleCenter,p1,p2) < (link2Radius + circleRadius)) )
%             disp('du traff sirkelen link2');
            link2Plot = plot( alpha, beta, '.red', 'lineWidth', 3);
        end
    end
    
end
% plot([3*pi/4 pi], [0 0], '-g');
% plot([-pi, -3*pi/4],[0,0], '-g');
% legend([link1Plot,link2Plot],'black link 1 hits obstacle', 'red link 2 hit obstacle');

hold off