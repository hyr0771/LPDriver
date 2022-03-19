function Write_LP_file_Parameter( Result,TopK,Dataset,P_value )
[rows, cols] = size (Result);
str='_Top';str2='.txt';str3='_Pvalue_';
STR=sprintf( '%s%s%s%s%s%s',Dataset,str,num2str(TopK),str3,P_value,str2);
fid=fopen ( STR , 'w');
for i = 1:TopK+1
    for j = 1:cols
        fprintf(fid, '%s\t', Result{i,j});
    end
    fprintf(fid, '\n');
end
fclose(fid);

end

