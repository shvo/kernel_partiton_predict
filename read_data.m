function [label,feature] = read_data(input_file)

data = importdata(input_file);
label = data.Data_Set_Label;
feature = data.Data_Set_Feature;
display(strcat('read data from ', input_file));