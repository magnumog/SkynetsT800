function grid = cornergrid(n)

k=sqrt(n);

figure;
axis([0 1 0 1]);
hold on;
for i=0:k
    for j=0:k
        plot(((1/k)*i),((1/k)*j),'.black','linewidth',3);
%         disp((1/n)+(1/n)*i);
    end
end
hold off;
end