function [linkPoly, nextLinkBase] = displaceLinkPoly( linkPolyRef, linkAngle, linkBase, nextLinkBaseRef )

%Rotational matrix in Euclidean space
rotation=[cos(linkAngle), -sin(linkAngle);sin(linkAngle), cos(linkAngle)];
% disp(rotation);

%Rotate the link and the endpoint
% linkPoly = mtimes(rotation,linkPolyRef);
linkPoly= (rotation*linkPolyRef')';
% nextLinkBase = mtimes(rotation,nextLinkBaseRef);
nextLinkBase = (rotation*nextLinkBaseRef')';

%Translate the rotated polygon to their new position
linkPoly(:,1) = linkPoly(:,1) + linkBase(1);
linkPoly(:,2) = linkPoly(:,2) + linkBase(2);
nextLinkBase(:,1) = nextLinkBase(1)+linkBase(1);
nextLinkBase(:,2) = nextLinkBase(2)+linkBase(2);


end


