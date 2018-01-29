function Probe_plot()
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

T = [600;600.000000000001;600;600;547.701300645056;541.503339020601;536.753024736079;518.938084827281;507.340633557391;495.631546780936;444.600206445360;300;300;300;492.662383383280;472.045806413857;447.491057879722;300];
elenodes(:,3) = T;

figure(1)
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
