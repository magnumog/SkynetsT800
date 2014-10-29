function path = computeBFSPath(start, goal, AdjTable)

tree = computeBFSEdges(start,AdjTable);

goalNode = goal;
pathFromStartToGoal = [];

%To get the path we build it backwards(from goal to start)
pathStillPossible = true;
while pathStillPossible
    pathStillPossible = false;
    for i=1:size(tree,1)
        if(tree(i,2) == goalNode)
            goalNode = tree(i,1);
            pathFromStartToGoal = [pathFromStartToGoal, tree(i,:)];
            pathStillPossible = true;
        end
    end
end

%Reverte the path, this way it will seem that the algorithm has followed
%the way from start to goal not from the goal to the start.
path = pathFromStartToGoal(end:-1:1,:);
end

