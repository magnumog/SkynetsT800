function path = computeBug1Path( start, goal, PolyList )
% Modificaton of the code from the computeBugBase.m file
% into the Bug1 algorithnm

tic
% distanceTraveled =0;
maxStepSize = 0.02;
circumNavigateLeaveToelerance=50;
circumNavigateStartTolerance=0.02

% Initialize the path variable 
path = start;

% Loop continuously until Bug reaches a termination condition and breaks
% out of the loop
while( true )
    
    distToGoal = dist( path(end,:), goal );
    
    % Has bug reached goal location?
    if( distToGoal < maxStepSize )
        break
    end
    
    distToClosestObstacle = distToGoal + maxStepSize;
    closestPolygon = [];
    
    % Loop through each polygonal obstacle in the list to find the closest
    % one to the Bug's current position.
    for i = 1:length(PolyList)
        distToObstacle = computeDistancePointToPolygon(path(end,:), PolyList{i});
        if( distToObstacle < distToClosestObstacle )
            distToClosestObstacle = distToObstacle;
            closestPolygon = PolyList{i};
        end
    end
    
    % Is bug inside polygon?
    if( length(closestPolygon) > 0 && inpolygon(path(end,1), path(end,2), closestPolygon(:,1), closestPolygon(:,2)) )
        disp('Error - bug entered polygon there is no path to goal')
        break
    end
    
    % Limit the length of a step the Bug will take based on proximity to
    % obstacles, goal so that it does not over shoot and enter an obstacle
    % or pass the goal location.
    stepSize = min( [maxStepSize, distToClosestObstacle/5, distToGoal] );
    
    % Has bug hit an obstacle?
    if( distToClosestObstacle < maxStepSize )
        %Circumnavigate the obstacle and find the closest point to goal
        obstaclePath = newBugPosition;
        obstacleStart = newBugPosition;
        closestPoint = newBugPosition;
        
        moveAroundObstacle=true;
        while(moveAroundObstacle)
            [u_x u_y] = computeTangentVectorToPolygon(obstaclePath(end,:),closestPolygon);
            step = stepSize*[u_x u_y];
%             distanceTraveled = distanceTraveled+step;
            newBugPosition = obstaclePath(end,:) + step;
            obstaclePath=[obstaclePath; newBugPosition];
            
            if(dist(newBugPosition,goal)<dist(closestPoint,goal))
                closestPoint=newBugPosition;
                closestIndex=size(obstaclePath,1);
            end
            
            %Is bug back at starting point then set move to false
            if(size(obstaclePath,1) > circumNavigateLeaveToelerance && dist(newBugPosition,obstacleStart)< circumNavigateStartTolerance)
                %Make bug move towards goal
                moveAroundObstacle=false;
            end
        end
        path=[path ; obstaclePath(1:end,:) ; obstaclePath(1:closestIndex,:)];
        
        u_x = (goal(1)-path(end,1))/distToGoal;
        u_y = (goal(2)-path(end,2))/distToGoal;
        step = stepSize*[u_x u_y];
%         distanceTraveled = distanceTraveled+step;
        movesToPolygon = path(end,:)+step;
        if(computeDistancePointToPolygon(path(end,:),closestPolygon)>computeDistancePointToPolygon(movesToPolygon, closestPolygon))
            disp('There is no path from start to goal');
        end        
    else
        % Step towards goal along unit vector u between current point and goal
        u_x = (goal(1) - path(end,1))/distToGoal;
        u_y = (goal(2) - path(end,2))/distToGoal;

        % Add new step to end of the path
        step = stepSize*[u_x, u_y];
%         distanceTraveled = distanceTraveled+step;
        newBugPosition = path(end,:) + step;
        path = [path; newBugPosition];
    end
    
end
    %The time taken
    disp('time taken to find path');
    toc
    %The distance traveled by bug
    stepSizes = path(2:end,:)-path(1:end-1,:);
    totalPathLength = 0;
    for i=1:length(stepSizes)
        totalPathLength = totalPathLength + norm(stepSizes(i,:));
    end
%         disp('Dist Traveled' + totalPathLength);
    disp('The bug has walked a length of: ');
    disp(totalPathLength);
return