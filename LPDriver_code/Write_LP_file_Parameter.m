function Write_LP_file_Parameter( Result,GenLength,TopK,Dataset,P_value,DegreeSize )
[rows, cols] = size (Result);
str1=' LP_rank_Revised_';str='_Top';str2='.txt';str3='_Pvalue_';str4='_DegreeSize';
SC=[Dataset,str1,num2str(GenLength),str,num2str(TopK),str3,P_value,str4,num2str(DegreeSize),str2];
STR=sprintf( '%s%s%s%s%s%s%s%s%s%s',Dataset,str1,num2str(GenLength),str,num2str(TopK),str3,P_value,str4,num2str(DegreeSize),str2);
fid=fopen ( STR , 'w');
for i = 1:TopK+1
    for j = 1:cols
        fprintf(fid, '%s\t', Result{i,j});
    end
    fprintf(fid, '\n');
end
fclose(fid);

end

