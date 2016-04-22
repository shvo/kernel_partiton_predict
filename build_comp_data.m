function [comp_label, comp_feature] = build_comp_data(perf, feature)

[H, W] = size(feature);

comp_label = zeros(H*H,1);
comp_feature = zeros(H*H,W*2);

for m = 1 : H
    
    for n = 1 : H
    
        index = H*(m-1)+n;
        comp_feature(index,:) = [feature(m,:),feature(n,:)];
        if (perf(m) == perf(n))  % execution time comparison
            symbol = 0;
        elseif (perf(m) > perf(n))
            symbol = 1;
        else
            symbol = 2;
        end
        comp_label(index,1) = symbol; 
        
    end
    
end




