function [ rank_result ] = Rank( result,md_adjmat,gene_list,patient_name )

[rows,cols]=size(md_adjmat);
num_ones=zeros(cols,1);
for i=1:cols
    num_ones(i,1)=nnz(md_adjmat(:,i));
end
num=rows-min(num_ones);
rank_result=cell(num+1,cols);

for i=1:cols
    [~,idx_sort]=sort(result(:,i),'descend');
    idx=find(md_adjmat(:,i)==0);
    for j=1:length(idx)
        del_idx= (idx(j,1)==idx_sort);
        idx_sort(del_idx,:)=[];
    end
    rank_result(1,i)=patient_name(i,1);
    for k=1:length(idx_sort)
        rank_result(k+1,i)=gene_list(idx_sort(k,1));
    end
    
end

end

