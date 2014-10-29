function BFSEdges = computeBFSEdges(start,AdjTable)

lengthOfAdjTable =length(AdjTable);

visitedNodeTable = zeroes(lengthOfAdjTable,1);
visitedNodeTable(start) = 1;

listOfVertexes = [start];
BFSEdges = [];

while (~isempty(listOfVertexes))
    vertex = listOfVertexes(1,:);
    listOfVertexes(1,:) = [];
    
    %Searching all neighboors of vertex
    for i=1:length(AdjTable{vertex})
        neighboor = AdjTable{vertex}(i);
        
        % check wheter the neighboor found have been visited before
        % if not do this
        if(visitedNodeTable==0)
            visitedNodeTable(neighboor) = visitedtable(vertex)+1;
            listOfVertexes = [listOfVertexes; neighboor];
            BFSEdges = [BFSEdges; vertex, neighboor];
        end
    end
end
end

