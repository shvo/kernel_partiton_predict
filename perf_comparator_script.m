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
    
% get training data
input_file = strcat(data_path, 'mm.mat')
[mm_label, mm_feature] = read_data(input_file);

input_file = strcat(data_path, 'mm-sfp.mat')
[mm_sfp_label, mm_sfp_feature] = read_data(input_file);

input_file = strcat(data_path, 'gemm.mat')
[gemm_label, gemm_feature] = read_data(input_file);

input_file = strcat(data_path, 'gemm-sfp.mat')
[gemm_sfp_label, gemm_sfp_feature] = read_data(input_file);

input_file = strcat(data_path, 'jacobi2d-ts-int.mat')
[jacobi2d_label, jacobi2d_feature] = read_data(input_file);



% feature scaling
feature_standard = feature;
feature = feature_scaling(feature_standard,feature);
mm_feature = feature_scaling(feature_standard, mm_feature);
mm_sfp_feature = feature_scaling(feature_standard, mm_sfp_feature);
gemm_feature = feature_scaling(feature_standard, gemm_feature);
gemm_sfp_feature = feature_scaling(feature_standard, gemm_sfp_feature);
jacobi2d_feature = feature_scaling(feature_standard, jacobi2d_feature);


% delte II feature
feature(:,3) = [];
micro_mm_feature(:,3) = [];
micro_mm_sfp_feature(:,3) = [];
micro_gemm_feature(:,3) = [];
micro_gemm_sfp_feature(:,3) = [];
micro_jacobi_feature(:,3) = [];

mm_feature(:,3) = [];
mm_sfp_feature(:,3) = [];
gemm_feature(:,3) = [];
gemm_sfp_feature(:,3) = [];
jacobi2d_feature(:,3) = [];


% build training data
perf = [micro_mm_max_perf;
        micro_mm_sfp_max_perf;
        micro_gemm_max_perf;
        micro_gemm_sfp_max_perf;
        micro_jacobi_max_perf;
        ];

[micro_mm_comp_label, micro_mm_comp_feature] = build_comp_data(micro_mm_max_perf, micro_mm_feature);
[micro_mm_sfp_comp_label, micro_mm_sfp_comp_feature] = build_comp_data(micro_mm_sfp_max_perf, micro_mm_sfp_feature);
[micro_gemm_comp_label, micro_gemm_comp_feature] = build_comp_data(micro_gemm_max_perf, micro_gemm_feature);
[micro_gemm_sfp_comp_label, micro_gemm_sfp_comp_feature] = build_comp_data(micro_gemm_sfp_max_perf, micro_gemm_sfp_feature);
[micro_jacobi_comp_label, micro_jacobi_comp_feature] = build_comp_data(micro_jacobi_max_perf, micro_jacobi_feature);


