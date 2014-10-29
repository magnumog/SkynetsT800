%%%% Sample MATLAB Code to compute BFS edges
%%%% based on Adjacency Lookup Table

%% number of nodes and lookup table for edges
n = 21;  
% AdjTable{1} = [2];
% AdjTable{2} = [1,3,4];
% AdjTable{3} = [2,5];
% AdjTable{4} = [2];
% AdjTable{5} = [3];
AdjTable{1}=[2]; 
AdjTable{2}=[1,3,6]; 
AdjTable{3}=[2,4]; 
AdjTable{4}=[3,5,7,13];
AdjTable{5}=[4,6]; 
AdjTable{6}=[2,5]; 
AdjTable{7}=[4,8]; 
AdjTable{8}=[7,9]; 
AdjTable{9}=[8,10,14];
AdjTable{10}=[9,11]; 
AdjTable{11}=[10,12]; 
AdjTable{12}=[11,13]; 
AdjTable{13}=[4,12];
AdjTable{14}=[9,15]; 
AdjTable{15}=[14,16]; 
AdjTable{16}=[15,17]; 
AdjTable{17}=[16,18];
AdjTable{18}=[17,19]; 
AdjTable{19}=[18,20,21]; 
AdjTable{20}=[19]; 
AdjTable{21}=[19];



%% start and goal node
start = 5;  goal  = 1;

%% mark all nodes as unvisited, except for start
marked = -1*ones(n,1);  marked (start) = 0;

%% prepare list of vertices to visit and BFS edges
VertexList = [start];  BFSEdges   = [];

%% loop while the list of vertices to visit is nonempty
while length(VertexList)>0, 

 %% pick first vertex and remove it from list
 v = VertexList(1,:);  VertexList(1,:) = [];

 %% find all neighbors of vertex that are unmarked
 for i=1:length(AdjTable{v})
 
  idx = AdjTable{v}(i);

  if (marked(idx) == -1),
   % found an unmarked neighbor, hence mark it
   % and add it to list of vertices to explore from
   % and save the useful edge
   marked(idx) = marked(v)+1;
   VertexList = [VertexList; idx];
   BFSEdges = [BFSEdges; v, idx];

  end %if

 end %for

end %while

% print out the BFS edges (in the form of an adjacency list)
BFSEdges



%%%% Sample MATLAB Code for goal-to-start iterative procedure
% Initialize path to an empty array
path = [];

% Build path backwards from goal to start through the BFS edges
tmp = goal;
while tmp ~= start,
  for j=1:size(BFSEdges,1), 
   if (BFSEdges(j,2)==tmp),
    tmp = BFSEdges(j,1);
    path = [path;BFSEdges(j,:)];
    break
   end
  end
end

% Reverse path so that we have a path from start to goal
path = path(end:-1:1,:)
