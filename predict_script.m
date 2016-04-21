% linear model
tic
linear_model = svmtrain(label, feature,'-t 0 -c 16 -q');  % SVM
toc

% rbf model
rbf_model = svmtrain(label, feature,'-t 2 -c 32 -g 2 -q');  % SVM

% predict mm
[mm_predict_label, mm_accuracy, mm_dec_values] = svmpredict(mm_label, mm_feature, linear_model);
[mm_predict_label, mm_accuracy, mm_dec_values] = svmpredict(mm_label, mm_feature, rbf_model);

% predict gemm
[gemm_predict_label, gemm_accuracy, gemm_dec_values] = svmpredict(gemm_label, gemm_feature, linear_model);
[gemm_predict_label, gemm_accuracy, gemm_dec_values] = svmpredict(gemm_label, gemm_feature, rbf_model);

% predict jacobi2d
[jacobi2d_predict_label, jacobi2d_accuracy, jacobi2d_dec_values] = svmpredict(jacobi2d_label, jacobi2d_feature, linear_model);
[jacobi2d_predict_label, jacobi2d_accuracy, jacobi2d_dec_values] = svmpredict(jacobi2d_label, jacobi2d_feature, rbf_model);