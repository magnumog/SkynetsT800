function grid = centergrid(n)

k=sqrt(n);

figure;
axis([0 1 0 1]);
hold on;
offset = ((1/k)/2);
for i=1:k
    for j=1:k
        plot(((1/k)*i)-offset,((1/k)*j)-offset,'.black','linewidth',3);
%         disp((1/n)+(1/n)*i);
    end
end
hold off;
end