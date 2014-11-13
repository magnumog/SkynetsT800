figure;
axis([0 1 0 1]);
hold on;
haltonBase2 = cell2mat(haltonsequence(2,100));
haltonBase3 = cell2mat(haltonsequence(3,100));
% disp(haltonBase2(1));
for i=1:length(haltonBase2)
    plot(haltonBase2(i),haltonBase3(i),'.black','linewidth',3);
end
hold off;