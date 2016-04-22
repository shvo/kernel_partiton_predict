% linear model
tic
linear_model = svmtrain(label, feature,'-t 0 -c 32 -q');  % SVM
toc

% rbf model
rbf_model = svmtrain(label, feature,'-t 2 -c 32 -g 2 -q');  % SVM

% predict mm
[mm_predict_label, mm_accuracy, mm_dec_values] = svmpredict(mm_label, mm_feature, linear_model);
%[mm_predict_label, mm_accuracy, mm_dec_values] = svmpredict(mm_label, mm_feature, rbf_model);

% predict mm-sfp
[mm_sfp_predict_label, mm_sfp_accuracy, mm_sfp_dec_values] = svmpredict(mm_sfp_label, mm_sfp_feature, linear_model);

% predict gemm
[gemm_predict_label, gemm_accuracy, gemm_dec_values] = svmpredict(gemm_label, gemm_feature, linear_model);
%[gemm_predict_label, gemm_accuracy, gemm_dec_values] = svmpredict(gemm_label, gemm_feature, rbf_model);

% predict gemm-sfp
[gemm_sfp_predict_label, gemm_sfp_accuracy, gemm_sfp_dec_values] = svmpredict(gemm_sfp_label, gemm_sfp_feature, linear_model);

% predict jacobi2d
[jacobi2d_predict_label, jacobi2d_accuracy, jacobi2d_dec_values] = svmpredict(jacobi2d_label, jacobi2d_feature, linear_model);
%[jacobi2d_predict_label, jacobi2d_accuracy, jacobi2d_dec_values] = svmpredict(jacobi2d_label, jacobi2d_feature, rbf_model);


% mm result analysis
LL = length(mm_predict_label);

mm_perf_rank = zeros(length(mm_perf),1);
for n = 1 : LL
    index_begin = 1 + 11*(n-1);
    index_end = 11*n;
    temp_perf_data = mm_perf(index_begin:index_end);
    [Y,I] = sort(temp_perf_data);
    mm_perf_rank(I+11*(n-1)) = [1:11]';
end

offset = [1:11:(LL-1)*11+1]';
index = mm_predict_label ./ 10 + offset;
mm_predict_perf = mm_perf(index);
mm_predict_perf_rank = mm_perf_rank(index);
mm_achieved_perf = mm_max_perf ./ mm_predict_perf;
mm_achieved_avg_perf = mean(mm_achieved_perf)
min(mm_achieved_perf)
max(mm_achieved_perf)

length(find(mm_predict_perf_rank==2))



% gemm result analysis
LL = length(gemm_predict_label);

gemm_perf_rank = zeros(length(gemm_perf),1);
for n = 1 : LL
    index_begin = 1 + 11*(n-1);
    index_end = 11*n;
    temp_perf_data = gemm_perf(index_begin:index_end);
    [Y,I] = sort(temp_perf_data);
    gemm_perf_rank(I+11*(n-1)) = [1:11]';
end

offset = [1:11:(LL-1)*11+1]';
index = gemm_predict_label ./ 10 + offset;
gemm_predict_perf = gemm_perf(index);
gemm_predict_perf_rank = gemm_perf_rank(index);
gemm_achieved_perf = gemm_max_perf ./ gemm_predict_perf;
gemm_achieved_avg_perf = mean(gemm_achieved_perf)
min(gemm_achieved_perf)
max(gemm_achieved_perf)
length(find(gemm_predict_perf_rank==2))

% jacobi2d result analysis
LL = length(jacobi2d_predict_label);

jacobi2d_perf_rank = zeros(length(jacobi2d_int_perf),1);
for n = 1 : LL
    index_begin = 1 + 11*(n-1);
    index_end = 11*n;
    temp_perf_data = jacobi2d_int_perf(index_begin:index_end);
    [Y,I] = sort(temp_perf_data);
    jacobi2d_perf_rank(I+11*(n-1)) = [1:11]';
end


offset = [1:11:(LL-1)*11+1]';
index = jacobi2d_predict_label ./ 10 + offset;
jacobi2d_predict_perf_rank = jacobi2d_perf_rank(index);
jacobi2d_predict_perf = jacobi2d_int_perf(index);
jacobi2d_achieved_perf = jacobi2d_int_max_perf ./ jacobi2d_predict_perf;
jacobi2d_achieved_avg_perf = mean(jacobi2d_achieved_perf)
min(jacobi2d_achieved_perf)
max(jacobi2d_achieved_perf)
length(find(jacobi2d_predict_perf_rank==2))