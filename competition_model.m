% competition model
function dNdt_dRdt = competition_model(t, N_R, C, K, S)

r = 1;
D = 0.25;
n_species = size(C,2);
n_resources = size(C,1);
N = N_R(1:n_species);
R = N_R(n_species+1:end);
dNdt_dRdt = zeros(n_species+n_resources,1);
p = zeros(n_species,1);
N_p = zeros(n_species,1);
for i=1:n_species
    p(i) = min(growth_rate(r, R, K(:,i), n_resources));
    N_p(i) = N(i) * p(i);
    dNdt_dRdt(i) = N(i) * (p(i)-D);
end

for j=1:n_resources
    disp(C(j,:)*N_p)
    dNdt_dRdt(j+n_species) = D * (S(j) - R(j)) - C(j,:) * N_p;
end

end