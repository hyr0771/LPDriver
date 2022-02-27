clear
clc

%**************Step 1:Input the informations of samples ****

expression_tumor_fileName = 'Example_tumor.txt';
GenLength='end';
P_value_input=0.05;
Network_Gene_degree_size_input=0;
Dataset=expression_tumor_fileName;

%%**************Step 2:Call the LPDriver****

[ LP_rank,gene_list,patient_name ] = LPDriver( expression_tumor_fileName,GenLength,P_value_input,Network_Gene_degree_size_input);
[LP_Gene_Number,~]=size(LP_rank); 
VariableTopK=[LP_Gene_Number-1];
[~,NumTopK]=size(VariableTopK);

%%**************Step 3:Output the result****

for i = 1:NumTopK
 Write_LP_file_Parameter( LP_rank,GenLength,VariableTopK(i),Dataset,P_value_input,Network_Gene_degree_size_input );
end


