function h = circle(x,y,r)

% hold on
% 
% th = 0:pi/50:2*pi;
% 
% xunit = r * cos(th) + x;
% 
% yunit = r * sin(th) + y;
% 
% h = plot(xunit, yunit, 'color','black');
% 
% hold off
% 

% % function h = circle2(x,y,r)
% % 
d = r*2;

px = x-r;

py = y-r;

h = rectangle('Position',[px py d d],'Curvature',[1,1],'FaceColor','k');

daspect([1,1,1])
