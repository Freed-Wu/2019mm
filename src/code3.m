clc
clear all;
close all;
%读取excel数据
[num,txt,data]= xlsread('C:\Users\LENOVO\Desktop\坐标.xlsx', 'sheet1', 'A2:C140');
%获取精度纬度
lon= num(:, 1);
lat = num(:, 2);

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

% % ----------------------需要两个战备节点进行修复
% % ------------43,51,55节点被摧毁后，采用一个节点进行修复
% % ----------------被摧毁之前的连接方式
% x2 = [x(43,:),x(51,:),x(55,:)];
% y2= [y(43,:),y(51,:),y(55,:)];
% plot(x2,y2, 'r.-', 'MarkerSize',10);
% hold on;
% x2 = [x(61,:),x(55,:)]
% y2 = [y(61,:),y(55,:)]
% plot(x2,y2, 'b.-', 'MarkerSize',10);
% hold on;
% x2 = [x(43,:),x(39,:)]
% y2 = [y(43,:),y(39,:)]
% plot(x2,y2, 'b.-', 'MarkerSize',10);
% hold on;
% x2 = [x(43,:),x(34,:)]
% y2 = [y(43,:),y(34,:)]
% plot(x2,y2, 'b.-', 'MarkerSize',10);

% % ----------------------被摧毁后的重建方式
% x1 = [x(34,:),x(39,:),x(61,:)];
% y1 = [y(34,:),y(39,:),y(61,:)];
% % [x,y]=([3212309.76768824],[569970.749839659]);
% % 对应的经纬度坐标近似为[软件给出的](111°43′07.04″,29°02′13.57″)；
% dist = @(var) sum(sqrt((var(1)-x1).^2+(var(2)-y1).^2));%var(1)=x1;var(2)=y1
% var0 = rand(1,2);
% [var,minDistance,exitflag] = fminunc(dist,var0)
% plot(x1,y1,'o','markerfacecolor','r','markersize',6);
% hold on;
% plot(var(1),var(2),'p','markerfacecolor','g')
% for i=1:3
% plot([var(1),x1(i)],[var(2),y1(i)],':');
% end

% % ------------63,53,49，52,46,37节点被摧毁后，采用一个节点进行修复
% % -------------------被摧毁前的连接方式
% x2 = [x(46,:),x(52,:)]
% y2 = [y(46,:),y(52,:)]
% plot(x2,y2, 'r.-', 'MarkerSize',10);
% hold on;
% x2 = [x(67,:),x(63,:)]
% y2 = [y(67,:),y(63,:)]
% plot(x2,y2, 'b.-', 'MarkerSize',10);
% hold on;
% x2 = [x(46,:),x(42,:)]
% y2 = [y(46,:),y(42,:)]
% plot(x2,y2, 'b.-', 'MarkerSize',10);
% hold on;
% x2 = [x(63,:),x(53,:),x(49,:),x(46,:),x(37,:)];
% y2 = [y(63,:),y(53,:),y(49,:),y(46,:),y(37,:)];
% plot(x2,y2, 'r.-', 'MarkerSize',10);

% % -----------------------------修复方式---------------------------------
% x1=[x(67,:),x(60,:),x(42,:)];
% y1=[y(67,:),y(60,:),y(42,:)];
% % [x,y]=([3506344.72809309],[1053812.07315380]);
% % 对应的经纬度坐标近似为[软件给出的](116°49′51.17″,31°33′32.67″)；
% dist=@(var) sum(sqrt((var(1)-x1).^2+(var(2)-y1).^2));%var(1)=x1;var(2)=y1
% var0=rand(1,2);
% [var,minDistance,exitflag] = fminunc(dist,var0)
% plot(x1,y1,'o','markerfacecolor','r','markersize',6);
% hold on;
% plot(var(1),var(2),'p','markerfacecolor','g')
% for i=1:3
% plot([var(1),x1(i)],[var(2),y1(i)],':');
% end
