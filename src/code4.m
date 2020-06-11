clc
clear all;
close all;
%读取excel数据
[num,txt,data]= xlsread('C:\Users\LENOVO\Desktop\坐标.xlsx', 'sheet1', 'A2:C140');
%获取精度纬度
lon= num(:, 1);
lat = num(:, 2);

MinTree = sparse(dist);
UG = tril(MinTree);
view(biograph(UG,[],'ShowArrows','off','ShowWeights','on'));  % 查看所有点连接路径图(运行速度极慢，数据太大了，谨慎运行)
[ST,pred] = graphminspantree(UG);% 最小生成树算法
view(biograph(ST,[],'ShowArrows','off','ShowWeights','on'));    % 显示最小生成树

Ans_1 = full(ST);
Ans1 = sum(sum(Ans_1));         % 最小路径数值

IG = tril(MinTree);
EDG = graphconncomp(ST);
uzi= xlsread('date.xls');%权值矩阵
n1 = IG(1); n2 = IG(2); n3 = IG(3); n4 = IG(4);
m1 = EDG(7); m2 = EDG(8) ; m3 = EDG(9); m4 = EDG(10);

xl=[m2 m3 m4]; x2=[ml m3 m4]; x3=[ml m2 m4];
Ll=len(n1); L2=1ength(n2); L3=1ength(n), L4=1ength(n4); L5=1ength(m,I); L6=1ength(m2); L7= 1eng(m3);

t = 1;
for i1 = 1:L1
	for j1 = 1:L5
		R(t,:) = [n1(i1) m1(j1) uzi(n1(i1) , m1(j1))];
		t = t + 1;
	end
end
for i1 = 1:L1
	for j1 = 1:L6
		R(t,:) = [n1(i1) m2(j1) uzi(n1(i1) , m2(j1))];
		t = t + 1;
	end
end
for i1 = 1:L1
	for j1 = 1:L7
		R(t,:) = [n1(i1) m3(j1) uzi(n1(i1) , m3(j1))];
		t = t + 1;
	end
end
for i1 = 1:L1
	for j1 = 1:L8
		R(t,:) = [n1(i1) m4(j1) uzi(n1(i1) , m4(j1))];
		t = t + 1;
	end
end
for i1 = 1:L2
	for j2 = 1:L6
		R(t,:) = [n2(i2) m2(j2) uzi(n2(i2) , m2(j2))];
		t = t + 1;
	end
end
for i1 = 1:L2
	for j2 = 1:L7
		R(t,:) = [n2(i2) m3(j2) uzi(n2(i2) , m3(j2))];
		t = t + 1;
	end
end
for i1 = 1:L2
	for j2 = 1:L8
		R(t,:) = [n2(i2) m4(j2) uzi(n2(i2) , m4(j2))];
		t = t + 1;
	end
end
for i1 = 1:L2
	for j2 = 1:L5
		R(t,:) = [n2(i2) m1(j2) uzi(n2(i2) , m1(j2))];
		t = t + 1;
	end
end
for i1 = 1:L3
	for j4 = 1:L6
		R(t,:) = [n3(i3) m2(j1) uzi(n3(i3) , m2(j1))];
		t = t + 1;
	end
end
for i1 = 1:L4
	for j4 = 1:L8
		R(t,:) = [n4(i4) m4(j4) uzi(n4(i4) , m4(j4))];
		t = t + 1;
	end
end

Determine the connected components.
L = bwlabeln(uzi, conn);
for k = 1:length(A)
	boundary = A{k};
	plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
%整个循环表示的是描边
