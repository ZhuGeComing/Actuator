%%  ѧϰĿ�꣺ ��Ҷ˹������ͳ��ʶ�𷽷�
load fisheriris    %% ��������
SL = meas(51:end,1);
SW = meas(51:end,2);
group = species(51:end);
h1 = gscatter(SL,SW,group,'rb','v^',[],'off');
set(h1,'LineWidth',2)
legend('Fisher versicolor','Fisher virginica','Location','NW')
%%   ����
[X,Y] = meshgrid(linspace(4.5,8),linspace(2,4));
X = X(:); Y = Y(:);
%% ָ��[X Y]���ݵ�ÿһ�е�ѵ����[SL SW]ָ����һ������
%%  [X Y]�����ѵ����[SL SW]������ͬ������
%%  group����������1����������������ָ��ѵ�����е�ÿһ��������һ��
%%  group��[SL SW]������ͬ������
%%  ͨ������[X Y]��[SL SW]�еĶ�������Э��������б���������
%%  ������[X Y]�е�ÿһ��������һ��
[C,err,P,logp,coeff] = classify([X Y],[SL SW],group,'quadratic');
%%   ����۲�
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



%%   ����QQ��1960009019
%%   ���߽���΢�Ź��ںţ�����һƷ�� 