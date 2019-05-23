% pointA = [1,9,90 * pi / 180];
% pointB = [8,10,270 * pi / 180];
%% setup
loop = 20;
TurnRadius = 2;
PathStep = -1;
f = fopen('data.txt' , 'w');
%% loop
for i=1:loop
    point = rand(2,3);
    upper = 30;
    tmpval = point(1:2,1:2)*30;
    tmptheta = point(1:2,3)*2*pi;
    pointA = [tmpval(1,1:2),tmptheta(1,1)];
    pointB = [tmpval(2,1:2),tmptheta(2,1)];
    %generate
    figure('name','Dubins curve');
    path = dubins_curve(pointA,pointB,TurnRadius,PathStep);
    %minrect
    data = path(:,1:2);
    rectpoint = minrect(data);
    %print
    fprintf(f,'%f %f %f\n',tmpval(1,1),tmpval(1,2),tmptheta(1,1));
    fprintf(f,'%f %f %f\n',tmpval(2,1),tmpval(2,2),tmptheta(2,1));
    for j = 1:4
        fprintf(f,'%f %f\n',rectpoint(j,1),rectpoint(j,2));
    end
end


% quiet=true;

% pointA = [8,10,90 * pi / 180];
% pointB = [13,13,180 * pi / 180];
% dubins_curve(pointA,pointB,TurnRadius,PathStep)
% pointA = [13,13,180 * pi / 180];
% pointB = [4,13,40 * pi / 180];
% dubins_curve(pointA,pointB,TurnRadius,PathStep)

% dataY = path(:,2);
%% Ãæ»ý
% [recty,rectx,area,perimeter] =  minboundrect(dataX, dataY);
% [wei hei] = minboxing(rectx(1:end-1),recty(1:end-1));