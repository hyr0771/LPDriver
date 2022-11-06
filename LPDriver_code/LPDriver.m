function [ LP_rank,gene_list,patient_name ] = LPDriver( expression_tumor_fileName,GenLength_input,P_value_input,Network_Gene_degree_size_input)

P_value=P_value_input;
Network_Gene_degree_size=Network_Gene_degree_size_input;
GenLength=GenLength_input;
Dataset=expression_tumor_fileName;
GenLength_1=GenLength+1;

[tumor,~,name_tumor]=importdata(expression_tumor_fileName);
gene_list=tumor.textdata(2:end,1);   % 2:end  2:101
patient_name=tumor.textdata(1,2:end);
tumor_data=tumor.data(1:end,:);      % 1:end  2:101

[~,patient_Number]=size(patient_name);

fprintf( " Dataset "+Dataset+" LP_rank_GenLength_"+GenLength+" P_value_"+P_value_input+" Gene_degree_size "+Network_Gene_degree_size+" start!\n");
tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CPDB=readtable('ConsensusPathDB_network.txt');
CPDB_array=table2array(CPDB);
CPDB_edge1=CPDB_array(1:end,1);
CPDB_edge2=CPDB_array(1:end,2);

[x11,y11]=ismember(CPDB_edge1,gene_list);
[x22,y22]=ismember(CPDB_edge2,gene_list);

yy=y11.*y22;
zz=[y11 y22];
zz(find(yy==0),:)=[];
N1=length(gene_list);
[N2,~]=size(zz);

Net1=zeros(N1,N1);

for i=1:N2
    
    Net1(zz(i,2),zz(i,1))=1;  
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[rows,cols]=size(tumor_data);
Temp_relation=zeros(rows,cols);

[R,p]=corrcoef(tumor_data');
final_R0=p;
final_R0(isnan(final_R0))=0;
final_R0(final_R0>=P_value)=0;
final_R0(final_R0~=0)=1;

for i=1:patient_Number
    
    i;
    NEW_data1=tumor_data;
    NEW_data1(:,i)=[];
    
    
    [R1,p1]=corrcoef(NEW_data1');
    final_R1=p1;
    final_R1(isnan(final_R1))=0;
    final_R1(final_R1>=P_value)=0;
    final_R1(final_R1~=0)=1;
    
    clear  NEW_data1
    
    C=abs(final_R0-final_R1).*Net1;
    
    [x,y]=find(C~=0);
    Dz1=[y x];
    N=length(C);
    
    [ LP_x1 ] = Opti_weight_Bipartite( Dz1,N  );  %%选基因方法在这改
    
    Temp_relation(:,i)=LP_x1;
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

neighbor_num=50;
KK=5;
r=0.5;
alpha=0.5;

md_adjmat_new = WKNKN_LPDriver(Temp_relation,Net1, KK, r );

similairty_matrix=Label_Propagation(md_adjmat_new,0,neighbor_num,'regulation2')  ;
LP_result=calculate_labels(similairty_matrix,md_adjmat_new,alpha) ;
[LP_rank] =Rank( LP_result, md_adjmat_new,gene_list,patient_name');

toc
