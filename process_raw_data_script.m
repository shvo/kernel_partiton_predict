% prepare data

raw_data_path = './../raw_data/';
data_path = './../data/';

  % read micro-mm
input_file = strcat(raw_data_path,'micromm-ts.log');
output_file = strcat(data_path,'micromm.mat');
clang_info = [7, 11, 11, 0, 3, 4];
process_raw_data(input_file, output_file, clang_info);

% read micro-mm-sfp
input_file = strcat(raw_data_path,'micromm-sfp-ts.log');
output_file = strcat(data_path,'micromm-sfp.mat');
clang_info = [7, 11, 11, 2, 1, 4];
process_raw_data(input_file, output_file, clang_info);

  % read micro-gemm
input_file = strcat(raw_data_path,'microgemm-ts.log');
output_file = strcat(data_path,'microgemm.mat');
clang_info = [11, 15, 15, 0, 5, 4];
process_raw_data(input_file, output_file, clang_info);

% read micro-gemm-sfp
input_file = strcat(raw_data_path,'microgemm-sfp-ts.log');
output_file = strcat(data_path,'microgemm-sfp.mat');
clang_info = [11, 15, 15, 4, 1, 4];
process_raw_data(input_file, output_file, clang_info);

  % read micro-jacobi-int
input_file = strcat(raw_data_path,'microjacobi1d-ts-int.log');
output_file = strcat(data_path,'microjacobi1d-ts-int.mat');
clang_info = [13, 25, 25, 1, 9, 12];
process_raw_data(input_file, output_file, clang_info);


 % read mm
input_file = strcat(raw_data_path,'mm-ts.log');
output_file = strcat(data_path,'mm.mat');
clang_info = [13, 19, 19, 0,11, 15];
[mm_perf, mm_max_perf] = process_raw_data(input_file, output_file, clang_info);

% read mm-sfp
input_file = strcat(raw_data_path,'mm-ts-sfp.log');
output_file = strcat(data_path,'mm-sfp.mat');
clang_info = [13, 19, 19, 2, 9, 15];
[mm_perf, mm_max_perf] = process_raw_data(input_file, output_file, clang_info);

  % read gemm
input_file = strcat(raw_data_path,'gemm-ts.log');
output_file = strcat(data_path,'gemm.mat');
clang_info = [17, 24, 24, 0, 7, 12];
[gemm_perf, gemm_max_perf] = process_raw_data(input_file, output_file, clang_info);

 % read gemm-sfp
input_file = strcat(raw_data_path,'gemm-sfp-ts.log');
output_file = strcat(data_path,'gemm-sfp.mat');
clang_info = [17, 24, 24, 4, 3, 12];
[gemm_perf, gemm_max_perf] = process_raw_data(input_file, output_file, clang_info);

  % read jacobi-2d-int
input_file = strcat(raw_data_path,'jacobi2d-ts-int.log');
output_file = strcat(data_path,'jacobi2d-ts-int.mat');
clang_info = [17, 41, 41, 1, 14, 20];
[jacobi2d_int_perf, jacobi2d_int_max_perf] = process_raw_data(input_file, output_file, clang_info);
