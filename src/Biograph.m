tic;
clc;
clear all;
close all;
%读取excel数据
[num,txt,data]= xlsread('src/data1.xlsx', 'sheet1', 'A2:C140');
%获取精度纬度
lon= num(:, 1);
lat = num(:, 2);

% % ---------------------------------第一问---------------------------------
% dist数组储存了两两定点的距离
[LA1,LA2]=meshgrid(num(:,2));
[LO1,LO2]=meshgrid(num(:,1));
% 计算两两之间的距离，单位为公里
dist = distance(LA1,LO1,LA2,LO2,almanac('earth','wgs84'));

% almanac('earth','wgs84')
MinTree = sparse(dist);
UG = tril(MinTree);
% 查看所有点连接路径图(运行速度极慢，数据太大了，谨慎运行)
% view(biograph(UG,[],'ShowArrows','off','ShowWeights','on'));
% 最小生成树算法
[ST,pred] = graphminspantree(UG);
% 显示最小生成树
%view(biograph(ST,[],'ShowArrows','off','ShowWeights','on'));
Ans_1 = full(ST);
% 最小路径数值
Ans1 = sum(sum(Ans_1));

% ----------------------------------第二问-----------------------------------
% 投影坐标地图，经纬度坐标转换为直角坐标
[lat lon]
dczone = utmzone(mean(lat,'omitnan'),mean(lon,'omitnan'))
utmstruct = defaultm('utm');
utmstruct.zone = dczone;
utmstruct.geoid = wgs84Ellipsoid;
utmstruct = defaultm(utmstruct)
[y,x] = mfwdtran(utmstruct,lat,lon)
ppt = 1.*num(:, 1);
scatter(x, y, 30, ppt, 'filled');

% % --------------------------2.1和三个城市相连的节点被摧毁后找到的战备节点的直角坐标
% x1=[x(99,:),x(102,:),x(113,:)];
% y1=[y(99,:),y(102,:),y(113,:)];
% % [x,y]=(4352037.942750743,913335.9302932987);
% % 对应的经纬度坐标近似为[软件给出的](115°47′13.46″,39°13′09.25″)[自己估算的]（119.405,26.5425）；
% dist=@(var) sum(sqrt((var(1)-x1).^2+(var(2)-y1).^2));%var(1)=x1;var(2)=y1
% var0=rand(2,1);
% [var,minDistance,exitflag] = fminunc(dist,var0)
% plot(x1,y1,'o','markerfacecolor','r','markersize',6);
% hold on;
% plot(var(1),var(2),'p','markerfacecolor','g')
% for i=1:3
% plot([var(1),x1(i)],[var(2),y1(i)],':');
% end
%
% % %----------------------------2.2和两个城市相连的节点被摧毁后找到的战备节点的直角坐标
% x1=[x(63,:),x(49,:)];
% y1=[y(63,:),y(49,:)];
% % [x,y]=([3514296.35183840],[812920.384799894]);
% % 对应的经纬度坐标近似为（114°34′10.04″,31°10′32.04″);
% [x1,y1]
% var(1) = mean(x1);
% var(2) = mean(y1);
% plot(x1,y1,'o','markerfacecolor','r','markersize',6);
% hold on;
% plot(var(1),var(2),'p','markerfacecolor','g')
% for i=1:2
% plot([var(1),x1(i)],[var(2),y1(i)],':');
% end

% %------------------------------------2.3 和一个城市相连的节点被摧毁后找到的战备节点的直角坐标
x1=[x(56,:),x(60,:)];
y1=[y(56,:),y(60,:)];
% [x,y]=([3520111.02880883]],[1294911.86958376]);
% 对应的经纬度坐标近似为（119°21′39.06″,31°32′30.07″);
[x1,y1]
var(1) = mean(x1);
var(2) = mean(y1);
plot(x1,y1,'o','markerfacecolor','r','markersize',6);
hold on;
plot(var(1),var(2),'p','markerfacecolor','g')
for i=1:2
	plot([var(1),x1(i)],[var(2),y1(i)],':');
end

% ----------------------绘制散点地图-------------------
% %获取维度以绘制颜色
% ppt = 1.*num(:, 1);
% %绘制散点图
% %scatter(lon, lat, 30*ones(size(data(:,1))), ppt, 'filled');  %--可以出图
% scatter(lon, lat, 30, ppt, 'filled');
% %colormap(jet(10));
% %hold on;
% colormap(flipud(jet(20)));
% %颜色条的位置
% colorbar('location', 'southoutside');

fprintf('Runtime is %f second.\n',toc)

