%%  学习目标： 贝叶斯分类器统计识别方法
load fisheriris    %% 载入数据
SL = meas(51:end,1);
SW = meas(51:end,2);
group = species(51:end);
h1 = gscatter(SL,SW,group,'rb','v^',[],'off');
set(h1,'LineWidth',2)
legend('Fisher versicolor','Fisher virginica','Location','NW')
%%   分类
[X,Y] = meshgrid(linspace(4.5,8),linspace(2,4));
X = X(:); Y = Y(:);
%% 指定[X Y]数据的每一行到训练集[SL SW]指定的一个类中
%%  [X Y]必须和训练集[SL SW]具有相同的列数
%%  group向量包含从1到组数的正整数，指明训练集中的每一行属于哪一类
%%  group和[SL SW]具有相同的行数
%%  通过计算[X Y]和[SL SW]中的二次正定协方差矩阵判别函数来分类
%%  决定了[X Y]中的每一行属于哪一类
[C,err,P,logp,coeff] = classify([X Y],[SL SW],group,'quadratic');
%%   分类观察
hold on;
gscatter(X,Y,C,'rb','.',1,'off');
K = coeff(1,2).const;
L = coeff(1,2).linear; 
Q = coeff(1,2).quadratic;
f = sprintf('0 = %g+%g*x+%g*y+%g*x^2+%g*x.*y+%g*y.^2',...
K,L,Q(1,1),Q(1,2)+Q(2,1),Q(2,2));
h2 = ezplot(f,[4.5 8 2 4]);
set(h2,'Color','m','LineWidth',2)
axis([4.5 8 2 4])
xlabel('Sepal Length')
ylabel('Sepal Width')
title('{\bf Classification with Fisher Training Data}')



%%   大仙QQ：1960009019
%%   在线教育微信公众号：大仙一品堂 