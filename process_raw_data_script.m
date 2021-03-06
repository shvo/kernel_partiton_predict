% prepare data
raw_data_path = './../raw_data/';
data_path = './../data/';

  % read micro-mm
input_file = strcat(raw_data_path,'micromm-ts.log');
output_file = strcat(data_path,'micromm.mat');
clang_info = [7, 11, 11, 0, 3, 4];
[micro_mm_perf, micro_mm_max_perf] = process_raw_data(input_file, output_file, clang_info);

% read micro-mm-sfp
input_file = strcat(raw_data_path,'micromm-sfp-ts.log');
output_file = strcat(data_path,'micromm-sfp.mat');
clang_info = [7, 11, 11, 2, 1, 4];
[micro_mm_sfp_perf, micro_mm_sfp_max_perf] = process_raw_data(input_file, output_file, clang_info);

  % read micro-gemm
input_file = strcat(raw_data_path,'microgemm-ts.log');
output_file = strcat(data_path,'microgemm.mat');
clang_info = [11, 15, 15, 0, 5, 4];
[micro_gemm_perf, micro_gemm_max_perf] = process_raw_data(input_file, output_file, clang_info);

% read micro-gemm-sfp
input_file = strcat(raw_data_path,'microgemm-sfp-ts.log');
output_file = strcat(data_path,'microgemm-sfp.mat');
clang_info = [11, 15, 15, 4, 1, 4];
[micro_gemm_sfp_perf, micro_gemm_sfp_max_perf] = process_raw_data(input_file, output_file, clang_info);

  % read micro-jacobi-int
input_file = strcat(raw_data_path,'microjacobi1d-ts-int.log');
output_file = strcat(data_path,'microjacobi1d-ts-int.mat');
clang_info = [13, 25, 25, 1, 9, 12];
[micro_jacobi_perf, micro_jacobi_max_perf] = process_raw_data(input_file, output_file, clang_info);



 % read mm
input_file = strcat(raw_data_path,'mm-ts.log');
output_file = strcat(data_path,'mm.mat');
clang_info = [13, 19, 19, 0,11, 15];
[mm_perf, mm_max_perf] = process_raw_data(input_file, output_file, clang_info);

% read mm-sfp
input_file = strcat(raw_data_path,'mm-ts-sfp.log');
output_file = strcat(data_path,'mm-sfp.mat');
clang_info = [13, 19, 19, 2, 9, 15];
[mm_sfp_perf, mm_sfp_max_perf] = process_raw_data(input_file, output_file, clang_info);

  % read gemm
input_file = strcat(raw_data_path,'gemm-ts.log');
output_file = strcat(data_path,'gemm.mat');
clang_info = [17, 24, 24, 0, 7, 12];
[gemm_perf, gemm_max_perf] = process_raw_data(input_file, output_file, clang_info);

 % read gemm-sfp
input_file = strcat(raw_data_path,'gemm-sfp-ts.log');
output_file = strcat(data_path,'gemm-sfp.mat');
clang_info = [17, 24, 24, 4, 3, 12];
[gemm_sfp_perf, gemm_sfp_max_perf] = process_raw_data(input_file, output_file, clang_info);

  % read jacobi-2d-int
input_file = strcat(raw_data_path,'jacobi2d-ts.log');
output_file = strcat(data_path,'jacobi2d.mat');
clang_info = [17, 45, 45, 1, 17, 20];
[jacobi2d_int_perf, jacobi2d_int_max_perf] = process_raw_data(input_file, output_file, clang_info);

 % read jacobi-2d-sfp
input_file = strcat(raw_data_path,'jacobi2d-sfp-ts.log');
output_file = strcat(data_path,'jacobi2d-sfp.mat');
clang_info = [17, 45, 45, 5, 13, 20];
[jacobi2d_sfp_perf, jacobi2d_sfp_max_perf] = process_raw_data(input_file, output_file, clang_info);


 % read gesummv
input_file = strcat(raw_data_path,'gesummv-ts.log');
output_file = strcat(data_path,'gesummv.mat');
clang_info = [18, 44, 44, 0, 9, 8];
[gesummv_perf, gesummv_max_perf] = process_raw_data(input_file, output_file, clang_info);

 % read gesummv-sfp
input_file = strcat(raw_data_path,'gesummv-sfp-ts.log');
output_file = strcat(data_path,'gesummv-sfp.mat');
clang_info = [18, 44, 44, 7, 2, 8];
[gesummv_sfp_perf, gesummv_sfp_max_perf] = process_raw_data(input_file, output_file, clang_info);

% read syrk
input_file = strcat(raw_data_path,'syrk-ts.log');
output_file = strcat(data_path,'syrk.mat');
clang_info = [15, 27, 27, 0, 7, 12];
[syrk_perf, syrk_max_perf] = process_raw_data(input_file, output_file, clang_info);

 % read syrk-sfp
input_file = strcat(raw_data_path,'syrk-sfp-ts.log');
output_file = strcat(data_path,'syrk-sfp.mat');
clang_info = [15, 27, 27, 4, 3, 12];
[syrk_sfp_perf, syrk_sfp_max_perf] = process_raw_data(input_file, output_file, clang_info);


% read syr2k
input_file = strcat(raw_data_path,'syr2k-ts.log');
output_file = strcat(data_path,'syr2k.mat');
clang_info = [15, 35, 35, 0, 22, 12];
[syr2k_perf, syr2k_max_perf] = process_raw_data(input_file, output_file, clang_info);

 % read syr2k-sfp
input_file = strcat(raw_data_path,'syr2k-sfp-ts.log');
output_file = strcat(data_path,'syr2k-sfp.mat');
clang_info = [15, 35, 35, 7, 15, 12];
[syr2k_sfp_perf, syr2k_sfp_max_perf] = process_raw_data(input_file, output_file, clang_info);


% read conv-2d-int
input_file = strcat(raw_data_path,'conv2d-ts.log');
output_file = strcat(data_path,'conv2d.mat');
clang_info = [7, 43, 43, 0, 51, 8];
[conv2d_int_perf, conv2d_int_max_perf] = process_raw_data(input_file, output_file, clang_info);

 % read conv-2d-sfp
input_file = strcat(raw_data_path,'conv2d-sfp-ts.log');
output_file = strcat(data_path,'conv2d-sfp.mat');
clang_info = [7, 43, 43, 17, 34, 8];
[conv2d_sfp_perf, conv2d_sfp_max_perf] = process_raw_data(input_file, output_file, clang_info);


% read conv-3d-int
input_file = strcat(raw_data_path,'conv3d-ts.log');
output_file = strcat(data_path,'conv3d.mat');
clang_info = [13, 86, 86, 0, 69, 12];
[conv3d_int_perf, conv3d_int_max_perf] = process_raw_data(input_file, output_file, clang_info);

 % read conv-3d-sfp
input_file = strcat(raw_data_path,'conv3d-sfp-ts.log');
output_file = strcat(data_path,'conv3d-sfp.mat');
clang_info = [13, 86, 86, 29, 40, 12];
[conv3d_sfp_perf, conv3d_sfp_max_perf] = process_raw_data(input_file, output_file, clang_info);


