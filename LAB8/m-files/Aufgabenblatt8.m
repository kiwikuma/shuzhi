function Aufgabenblatt8()
format long
% elenodes
r = 0.02;
elenodes = zeros(18,2);
elenodes(1,:) = [0,0];
elenodes(2,:) = [0.1,0];
elenodes(3,:) = [0.2,0];
elenodes(4,:) = [0.3,0];
elenodes(5,:) = [0,0.1];
elenodes(6,:) = [0.1,0.1];
elenodes(7,:) = [0.2,0.1];
elenodes(8,:) = [0.3,0.1];
elenodes(9,:) = [0,0.2];
elenodes(10,:) = [0.1,0.2];
elenodes(11,:) = [0.2,0.2];
elenodes(12,:) = [0.3-r*sin(pi/6),0.3-r*cos(pi/6)];
elenodes(13,:) = [0.3,0.3-r];
elenodes(14,:) = [0.3-r*cos(pi/6),0.3-r*sin(pi/6)];
elenodes(15,:) = [0,0.3];
elenodes(16,:) = [0.1,0.3];
elenodes(17,:) = [0.3/2,0.3];
elenodes(18,:) = [0.3-r,0.3];
% elements
elements = zeros(10,4);
elements(1,:) = [1,2,6,5];
elements(2,:) = [2,3,7,6];
elements(3,:) = [3,4,8,7];
elements(4,:) = [5,6,10,9];
elements(5,:) = [6,7,11,10];
elements(6,:) = [7,12,14,11];
elements(7,:) = [7,8,13,12];
elements(8,:) = [9,10,16,15];
elements(9,:) = [10,11,17,16];
elements(10,:) = [11,14,18,17];
% nodes
nodes = zeros(4,2);
% conditions
theta = 0.5;
timInt_m = 1;
firststep = 0;
timestep = 500;
t_final = 3500;
n = floor(t_final/timestep);
T = zeros(18,n+1);
T(:,1) = 300;
elesol = zeros(4,1);
% Anfangsbedinung
elesol = elesol + 300;
% dbc
dbc = [1,600;2,600;3,600;4,600;12,300;13,300;14,300;18,300];

for k = 1:n
sysmat = zeros(18);
rhs = zeros(18,1);
for i = 1:10
    nodes(1,:) = elenodes(elements(i,1),:);
    nodes(2,:) = elenodes(elements(i,2),:);
    nodes(3,:) = elenodes(elements(i,3),:);
    nodes(4,:) = elenodes(elements(i,4),:);
    gpx = gx2dref(3);
    gpw = gw2dref(3);
    eleosol = elesol;
    elesol(1) = T(elements(i,1),k);
    elesol(2) = T(elements(i,2),k);
    elesol(3) = T(elements(i,3),k);
    elesol(4) = T(elements(i,4),k);
    [elemat,elevec] = evaluate_instat(nodes,gpx,gpw,elesol,eleosol,timInt_m,timestep,theta,firststep);
    [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,elements(i,:));
end
[sysmat,rhs] = assignDBC(sysmat,rhs,dbc);
T(:,k+1) = sysmat\rhs;
end
elenodes(:,3) = T(:,k+1);
% 3D-Quadplot
figure(1)
clf
patch('Vertices',elenodes,'Faces',elements,'FaceVertexCData',T(:,k+1),'Facecolor','interp','linestyle','none');
view(3);
axis([0,0.35,0,0.35,300,600]);
%set(gca,'xdir','reverse');
%set(gca,'ydir','reverse');
xlabel('x');
ylabel('y');
zlabel('temperature');
title('Temperaturverteilung stationaer');
grid minor;
colormap('autumn');
colorbar;
end