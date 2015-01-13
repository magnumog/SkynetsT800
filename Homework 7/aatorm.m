function rotation = aatorm( v, theta )
id=eye(3);
skew=[0,-v(3),v(2);v(3),0,-v(1);-v(2),v(1),0];
skewpower=skew^2;
rotation =id+(sin(theta)*skew)+((1-cos(theta))*skewpower);
end

