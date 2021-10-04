function p = growth_rate(r_i, R, K_i, n_resources)
p = zeros(size(K_i,2),1);
for j=1:n_resources
    p(j) =  r_i*R(j)/(K_i(j) + R(j));
    disp(p(j))    
end


