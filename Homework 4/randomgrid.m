function grid = randomgrid(n)

k=sqrt(n);
figure;
axis([0 1 0 1]);
hold on;
for i=0:k
    for j=0:k
        plot(rand,rand,'.black','linewidth',3);
    end
end
hold off;

end