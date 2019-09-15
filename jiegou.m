%%   学习目标： 结构模式识别方法树分类法
load fisheriris
t = classregtree(meas,species,'names',{'SL' 'SW' 'PL' 'PW'})
treetype = type(t)  %查看t的类型
view(t)             %观察树图


%%   大仙QQ：1960009019
%%   在线教育微信公众号：大仙一品堂 