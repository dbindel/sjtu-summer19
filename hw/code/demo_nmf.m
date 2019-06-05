A = [0, 0, 0, 1, 0;
     0, 0, 0, 0, 1;
     0, 0, 0, 0, 1;
     1, 0, 1, 0, 0;
     1, 0, 0, 0, 0;
     0, 1, 0, 0, 0;
     1, 0, 1, 1, 0;
     0, 1, 1, 0, 0;
     0, 0, 1, 1, 1;
     0, 1, 1, 0, 0];

% SVD-based initial factorization
k = 3;
[U, S, V] = svd(A);
[W0, H0] = svd_nmf_init(U, S, V, k);

% HALS-RRI iteration (you do!)

% Plots
semilogy(1:nstep, resid-resid(end), ...
         1:nstep, resid_aa-resid(end));
