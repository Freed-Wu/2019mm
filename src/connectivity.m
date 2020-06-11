function [out] = connectivity(in1,in2,ST)

tic;
clc;
close;

%in
in=sort([in1 in2]);

st=full(ST);
st=st'+st;
st=sign(st);
n=length(st);
h=BK_Create(n-2);

dc=[st(in(1),:);st(in(2),:)];
dc(:,[in(1) in(2)])=[];

sc=st;
sc([in(1) in(2)],:)=[];
sc(:,[in(1) in(2)])=[];

BK_SetUnary(h,dc); %添加数据项
BK_SetNeighbors(h,sc); %添加平滑项
e = BK_Minimize(h);
L = BK_GetLabeling(h);

%out
fprintf('最小割为%d\n',e);
%disp(L);

fprintf('Runtime is %f second.\n',toc)

end

