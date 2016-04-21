function [all_perf, max_perf] = process_raw_data(input_file, output_file, extra)

A = importdata(input_file);

[H_A, W_A] = size(A);

all_perf = A(:,end);
max_perf = zeros(H_A/11,1);

% build label and feature set
Data_Set_Label = zeros(H_A/11,1);
Data_Set_Feature = zeros(H_A/11,5);
for n = 1 : H_A/11
   Index = 11*(n-1)+1:11*n;
   [Y,I] = min(A(Index,W_A));
   max_perf(n,1) = Y;
   Data_Set_Label(n) = A(11*(n-1)+I,5);
   Data_Set_Feature(n,:) = [A(11*(n-1)+I,1:4),A(11*(n-1)+I,6)];
end

%extra = [7, 11, 11, 0, 3, 4];
le = length(extra);
MM = [ones(H_A/11,1),zeros(H_A/11,le-1)];
NN = [extra;zeros(le-1,le)];
Extra_Feature = MM * NN;
Data_Set_Feature = [Data_Set_Feature,Extra_Feature];

save(output_file,'Data_Set_Label','Data_Set_Feature');

display(strcat('successfully saved to ', output_file));