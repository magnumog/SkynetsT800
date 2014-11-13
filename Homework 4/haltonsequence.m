function sequence = haltonsequence( base, sequenceLenght )

sequence = {};
for i=1:sequenceLenght
    itemp=i;
    x=0;
    f=1/base;
    while(itemp>0)
        q=floor(itemp/base);
        r=mod(itemp,base);
        x=x+f*r;
        itemp=q;
        f=f/base;       
    end
%     disp(x);
    sequence = [sequence, x];
end
% disp(sequence);
end

