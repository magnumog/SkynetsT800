function [angleVector,angle] = rmtoaa( rotationMatrix )
angle = acos((trace(rotationMatrix)-1)/2);
mat= rotationMatrix-transpose(rotationMatrix);
angleVector=(1/(2*sin(angle)))*invershat(mat);
if(angle==0)
    angleVector=[1;0;0];
end

