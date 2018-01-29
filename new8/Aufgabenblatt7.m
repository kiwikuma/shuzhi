function Aufgabenblatt7()
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
% systemmatrix
sysmat = zeros(18);
% rhs
rhs = zeros(18,1);
% main programm
nodes = zeros(4,2);
for i = 1:10
    nodes(1,:) = elenodes(elements(i,1),:);
    nodes(2,:) = elenodes(elements(i,2),:);
    nodes(3,:) = elenodes(elements(i,3),:);
    nodes(4,:) = elenodes(elements(i,4),:);
    gpx = gx2dref(3);
    gpw = gw2dref(3);
    [elemat,elevec] = evaluate_stat(nodes,gpx,gpw);
    [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,elements(i,:));
end
% dbc
dbc = [1,600;2,600;3,600;4,600;12,300;13,300;14,300;18,300];
% assignDBC
[sysmat,rhs] = assignDBC(sysmat,rhs,dbc);
% loesung
T = (inv(sysmat))*rhs;
elenodes(:,3) = T;
figure(1)
quadplot(elenodes,elements,T)
xlabel('x');
ylabel('y');
zlabel('temperature');
title('Temperaturverteilung stationaer');
grid minor;
colormap('autumn');
colorbar;
% 3D-Quadplot
figure(2)
clf
patch('Vertices',elenodes,'Faces',elements,'FaceVertexCData',T,'Facecolor','interp','linestyle','none');
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