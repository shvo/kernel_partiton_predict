% data training

data_path = './../data/';

  % get micro-mm data
input_file = strcat(data_path, 'micromm.mat')
[micro_mm_label, micro_mm_feature] = read_data(input_file);

  % get micro-mm-sfp data
input_file = strcat(data_path, 'micromm-sfp.mat')
[micro_mm_sfp_label, micro_mm_sfp_feature] = read_data(input_file);

  % get micro-gemm data
input_file = strcat(data_path, 'microgemm.mat')
[micro_gemm_label, micro_gemm_feature] = read_data(input_file);

 % get micro-gemm-sfp data
input_file = strcat(data_path, 'microgemm-sfp.mat')
[micro_gemm_sfp_label, micro_gemm_sfp_feature] = read_data(input_file);

  % get micro-jacobi-int data
input_file = strcat(data_path, 'microjacobi1d-ts-int.mat')
[micro_jacobi_label, micro_jacobi_feature] = read_data(input_file);


% data set merging
label = [micro_mm_label;
         micro_mm_sfp_label;
         micro_gemm_label;
         micro_gemm_sfp_label;
         micro_jacobi_label;
        ];
    
feature = [micro_mm_feature;
           micro_mm_sfp_feature;
           micro_gemm_feature;
           micro_gemm_sfp_feature;
           micro_jacobi_feature;
           ];

       
% get prediction data
input_file = strcat(data_path, 'mm.mat')
[mm_label, mm_feature] = read_data(input_file);

input_file = strcat(data_path, 'mm-sfp.mat')
[mm_sfp_label, mm_sfp_feature] = read_data(input_file);

input_file = strcat(data_path, 'gemm.mat')
[gemm_label, gemm_feature] = read_data(input_file);

input_file = strcat(data_path, 'gemm-sfp.mat')
[gemm_sfp_label, gemm_sfp_feature] = read_data(input_file);

input_file = strcat(data_path, 'jacobi2d.mat')
[jacobi2d_label, jacobi2d_feature] = read_data(input_file);

input_file = strcat(data_path, 'jacobi2d-sfp.mat')
[jacobi2d_sfp_label, jacobi2d_sfp_feature] = read_data(input_file);

input_file = strcat(data_path, 'gesummv.mat')
[gesummv_label, gesummv_feature] = read_data(input_file);

input_file = strcat(data_path, 'gesummv-sfp.mat')
[gesummv_sfp_label, gesummv_sfp_feature] = read_data(input_file);

input_file = strcat(data_path, 'syrk.mat')
[syrk_label, syrk_feature] = read_data(input_file);

input_file = strcat(data_path, 'syrk-sfp.mat')
[syrk_sfp_label, syrk_sfp_feature] = read_data(input_file);

input_file = strcat(data_path, 'syr2k.mat')
[syr2k_label, syr2k_feature] = read_data(input_file);

input_file = strcat(data_path, 'syr2k-sfp.mat')
[syr2k_sfp_label, syr2k_sfp_feature] = read_data(input_file);

input_file = strcat(data_path, 'conv2d.mat')
[conv2d_label, conv2d_feature] = read_data(input_file);

input_file = strcat(data_path, 'conv2d-sfp.mat')
[conv2d_sfp_label, conv2d_sfp_feature] = read_data(input_file);

input_file = strcat(data_path, 'conv3d.mat')
[conv3d_label, conv3d_feature] = read_data(input_file);

input_file = strcat(data_path, 'conv3d-sfp.mat')
[conv3d_sfp_label, conv3d_sfp_feature] = read_data(input_file);


% feature scaling
feature_standard = feature;
feature = feature_scaling(feature_standard,feature);
mm_feature = feature_scaling(feature_standard, mm_feature);
mm_sfp_feature = feature_scaling(feature_standard, mm_sfp_feature);
gemm_feature = feature_scaling(feature_standard, gemm_feature);
gemm_sfp_feature = feature_scaling(feature_standard, gemm_sfp_feature);
jacobi2d_feature = feature_scaling(feature_standard, jacobi2d_feature);
jacobi2d_sfp_feature = feature_scaling(feature_standard, jacobi2d_sfp_feature);
gesummv_feature = feature_scaling(feature_standard, gesummv_feature);
gesummv_sfp_feature = feature_scaling(feature_standard, gesummv_sfp_feature);
syrk_feature = feature_scaling(feature_standard, syrk_feature);
syrk_sfp_feature = feature_scaling(feature_standard, syrk_sfp_feature);
syr2k_feature = feature_scaling(feature_standard, syr2k_feature);
syr2k_sfp_feature = feature_scaling(feature_standard, syr2k_sfp_feature);
conv2d_feature = feature_scaling(feature_standard, conv2d_feature);
conv2d_sfp_feature = feature_scaling(feature_standard, conv2d_sfp_feature);
conv3d_feature = feature_scaling(feature_standard, conv3d_feature);
conv3d_sfp_feature = feature_scaling(feature_standard, conv3d_sfp_feature);



% delte II feature
feature(:,3) = [];
mm_feature(:,3) = [];
mm_sfp_feature(:,3) = [];
gemm_feature(:,3) = [];
gemm_sfp_feature(:,3) = [];
jacobi2d_feature(:,3) = [];
jacobi2d_sfp_feature(:,3) = [];
gesummv_feature(:,3) = [];
gesummv_sfp_feature(:,3) = [];
syrk_feature(:,3) = [];
syrk_sfp_feature(:,3) = [];
syr2k_feature(:,3) = [];
syr2k_sfp_feature(:,3) = [];
conv2d_feature(:,3) = [];
conv2d_sfp_feature(:,3) = [];
conv3d_feature(:,3) = [];
conv3d_sfp_feature(:,3) = [];


% predict

% linear model
linear_model = svmtrain(label, feature,'-t 0 -c 32 -q');  % SVM

% rbf model
rbf_model = svmtrain(label, feature,'-t 2 -c 32 -g 2 -q');  % SVM