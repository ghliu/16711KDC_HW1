global numLink numObs Obs
global h_axes drawLink drawGoal drawObs;

scrsz = get(0,'ScreenSize');
animation = figure(1);
clf(animation);

color0 = [0 0 0];

%%
set(animation,'name','My Robot','Position',[20 100 800 800]);
h_axes = axes();

%%
drawObs = {};
for i = 1:numObs,
    color = rand(1,3);
    [x y z ] = sphere;
    drawObs{i} = surf(...
        x*Obs(i,end) + Obs(i,1), ...
        y*Obs(i,end) + Obs(i,2), ...
        z*Obs(i,end) + Obs(i,3), ...
        'Parent',h_axes,'FaceColor',color,'Visible','on', 'FaceAlpha', 0.5, 'LineStyle', 'none');
    
end;

drawGoal = line('Parent',h_axes,'Color',color0,'Visible','off','LineWidth',10);

drawLink = {};
for i = 1:numLink,
    color = rand(1,3);
    drawLink{i} = line('Parent',h_axes,'Color',color,'Visible','off','LineWidth',10);
end;

%%
set(h_axes, 'Parent',animation,'Units','Pixels',...
    'Ylim',[-5.0 5.0],'Xlim',[-5.0 5.0], 'Zlim', [-5.0 5.0], ...
    'YGrid', 'on', 'XGrid', 'on', 'ZGrid', 'on', 'visible','on');

h_axes.YLabel.String = 'y';
h_axes.XLabel.String = 'x';
h_axes.ZLabel.String = 'z';
