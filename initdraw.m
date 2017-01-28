global numLink 
global h_axes drawLink drawGoal;

scrsz = get(0,'ScreenSize');
animation = figure(1);
clf(animation);

color0 = [0 0 0];
% color1 = [1 0 0];
% color2 = [0 0 1];
% color3 = [0 1 0];
% color4 = [1 0 1];

set(animation,'name','My Robot','Position',[20 100 800 800]);
ylabel.String = 'Y-axis'; ylabel.FontSize = 12;
xlabel.String = 'Y-axis'; xlabel.FontSize = 12;
zlabel.String = 'Y-axis'; zlabel.FontSize = 12;
h_axes = axes('Parent',animation,'Units','Pixels',...
    'Ylim',[-1.0 1.0],'Xlim',[-1.0 1.0], 'zlim', [-1.0 1.0], ...
    'YGrid', 'on', 'XGrid', 'on', 'ZGrid', 'on');
h_axes.YLabel.String = 'y';
h_axes.XLabel.String = 'x';
h_axes.ZLabel.String = 'z';

drawGoal = line('Parent',h_axes,'Color',color0,'Visible','off','LineWidth',10);

drawLink = {};
for i = 1:numLink,
    color = rand(1,3);
    drawLink{i} = line('Parent',h_axes,'Color',color,'Visible','off','LineWidth',10);
end;

% link1 = line('Parent',h_axes,'Color',color1,'Visible','off','LineWidth',10);
% link2 = line('Parent',h_axes,'Color',color2,'Visible','off','LineWidth',10);
% link3 = line('Parent',h_axes,'Color',color3,'Visible','off','LineWidth',10);

set(h_axes,'visible','on');
