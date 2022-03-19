clear
clc

%**************Step 1:Input the informations of samples ****

expression_tumor_fileName = 'Example_tumor.txt';
P_value_input=0.05;
Dataset=expression_tumor_fileName;

%%**************Step 2:Call the LPDriver****

[ LP_rank,gene_list,patient_name ] = LPDriver( expression_tumor_fileName,P_value_input);
[LP_Gene_Number,~]=size(LP_rank); 
VariableTopK=[LP_Gene_Number-1];
[~,NumTopK]=size(VariableTopK);

%%**************Step 3:Output the result****

for i = 1:NumTopK
 Write_LP_file_Parameter( LP_rank,VariableTopK(i),Dataset,P_value_input);
end


