% data training

data_path = './../data/';

  % get micro-mm data
input_file = strcat(data_path, 'micromm.mat')
[micro_mm_label, micro_mm_feature] = read_data(input_file);

  % get micro-gemm data
input_file = strcat(data_path, 'microgemm.mat')
[micro_gemm_label, micro_gemm_feature] = read_data(input_file);

  % get micro-jacobi-int data
input_file = strcat(data_path, 'microjacobi1d-ts-int.mat')
[micro_jacobi_label, micro_jacobi_feature] = read_data(input_file);


% data set merging
label = [micro_mm_label;
         micro_gemm_label;
         micro_jacobi_label;
        ];
    
feature = [micro_mm_feature;
           micro_gemm_feature;
           micro_jacobi_feature;
           ];

       
% get training data
input_file = strcat(data_path, 'mm.mat')
[mm_label, mm_feature] = read_data(input_file);

input_file = strcat(data_path, 'gemm.mat')
[gemm_label, gemm_feature] = read_data(input_file);

input_file = strcat(data_path, 'jacobi2d-ts-int.mat')
[jacobi2d_label, jacobi2d_feature] = read_data(input_file);



% feature scaling
feature_standard = feature;
feature = feature_scaling(feature_standard,feature);
mm_feature = feature_scaling(feature_standard, mm_feature);
gemm_feature = feature_scaling(feature_standard, gemm_feature);
jacobi2d_feature = feature_scaling(feature_standard, jacobi2d_feature);


% delte II feature
feature(:,3) = [];
mm_feature(:,3) = [];
gemm_feature(:,3) = [];
jacobi2d_feature(:,3) = [];


% predict

% linear model
linear_model = svmtrain(label, feature,'-t 0 -c 16 -q');  % SVM

% rbf model
rbf_model = svmtrain(label, feature,'-t 2 -c 32 -g 2 -q');  % SVM