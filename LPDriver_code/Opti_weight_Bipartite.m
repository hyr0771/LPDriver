function [ new_x ] = Opti_weight_Bipartite( dz,NN  )
global M
global N
global Map
global p
global vis

uz=unique(dz);
[ind,z1]=ismember(dz(:,1),uz);
[ind,z2]=ismember(dz(:,2),uz);
z=[z1 z2];
Nz=max(max(z));

N1=Nz;
[N2,~]=size(z);
%calculate the adjacency matrix of bipartite graph
A_adjacent=zeros(N2,N1);
for i=1:N2
    
    A_adjacent(i,z(i,1))=1;
    A_adjacent(i,z(i,2))=1;
    
end

M = N2;
N = N1;
Map = A_adjacent;
p = zeros(N, 1);
vis = zeros(N, 1);
cnt = Hungarian_Algorithm();

new_x=zeros(NN,1);
new_x(uz(find(p~=0)),1)=1;

end