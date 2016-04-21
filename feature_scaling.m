function feature = feature_scaling(feature_standard, feature)

[H_F, W_F] = size(feature);
Feature_Max = max(feature_standard);
for n = 1 : W_F
    if(Feature_Max(n)>0)
        feature(:,n) = feature(:,n) ./ Feature_Max(n);
    end
end