clear;

addpath('ours','IQA');
str = '.\VV\';
for i = 1:1:22
   
    f = imread([str,num2str(i),'.jpg']);
    out = our(f);
    result1(i) = brisque(out);
    result2(i) = ceiq(out);
    result3(i) = eniqa(out);
    result4(i) = niqe(out);
    result5(i) = piqe(out);
end
 
avg_brisq = mean(result1);
avg_ceiq = mean(result2);
avg_eniqa = mean(result3);
avg_niqe = mean(result4);
avg_piqe = mean(result5);

