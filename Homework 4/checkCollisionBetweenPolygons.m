function bCollide = checkCollisionBetweenPolygons(P1, P2)

bCollide = false;

insidePolyggon1 = inpolygon(P2(:,1),P2(:,2),P1(:,1),P1(:,2));
if(any(insidePolyggon1))
    bCollide = true;
    return;
end

insidePolygon2 = inpolygon(P1(:,1),P1(:,2),P2(:,1),P2(:,2));
if(any(insidePolygon2))
    bCollide = true;
    return;
end
if(~bCollide)
    for i = 1:(size(P1,1)-1)
        segmentOne_one = P1(i, :);
        segmentOne_two = P1(i+1, :);

        for j = 1:(size(P2,1)-1)
            segmentTwo_one = P2(j, :);
            segmentTwo_two = P2(j+1, :);

            x = ((segmentTwo_two(2)-segmentTwo_one(2))*(segmentOne_two(1)-segmentOne_one(1)) - (segmentTwo_two(1)-segmentTwo_one(1))*(segmentOne_two(2)-segmentOne_one(2)));

            y = ((segmentTwo_two(1)-segmentTwo_one(1))*(segmentOne_one(2)-segmentTwo_one(2)) - (segmentTwo_two(2)-segmentTwo_one(2))*(segmentOne_one(1)-segmentTwo_one(1)));

            if( abs(x) < 0.01 && abs(y) < 0.01 )
                bCollide = true;
                return;
            end

            z = ((segmentOne_two(1)-segmentOne_one(1))*(segmentOne_one(2)-segmentTwo_one(2)) - (segmentOne_two(2)-segmentOne_one(2))*(segmentOne_one(1)-segmentTwo_one(1)));

            y = (y/x);
            z = (z/x);

            if( y>=0 && y<=1 && z>=0 && z<=1 )
                bCollide = true;
                return;
            end
        end
    end
end
end