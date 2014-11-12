function freeConfigs = computeTwoPolyLinkFreePoints( sampleList, link1BaseRef,link1PolyRef, link2BaseRef, link2PolyRef, ObstacleList )

    freeConfigs = [];
    collisionDetected = false;
    for i=1:size(sampleList(:,1))
        alfa = sampleList(i,1);
        beta = sampleList(i,2);
        [polygonOne, base] = displaceLinkPoly(link1PolyRef,alfa,link1BaseRef,link2BaseRef);
        [polygonTwo, manipulator] = displaceLinkPoly(link2PolyRef,alfa+beta,base,[0,0]);
        for j=1:length(ObstacleList)
            if(checkCollisionBetweenPolygons(polygonOne,ObstacleList{j}) || checkCollisionBetweenPolygons(polygonTwo,ObstacleList{j}))
                collisionDetected = true;
            end
        end
        %If no collision detected add space to free configspace
        if(not(collisionDetected))
           freeConfigs(size(freeConfigs,1)+1,:) = [alfa,beta];
        end
        collisionDetected = false;
        
        
    end
end