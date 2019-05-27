m = 1000;
n = 500;
k = 5;
d = 0.2;
lambda = 0.01;

U = rand(m,k);
V = rand(n,k);
II = (rand(m,n) < d);
I = find(II);
A = U*V';
PA = A(I) + 0.1*randn(size(I));

% Initialize from an SVD
AA = zeros(size(A));
AA(I) = PA;
[U,S,V] = svd(AA, 0);
sigma = diag(S);

% Initialize
X = U(:,1:k) * diag(sqrt(sigma(1:k)));
Y = V(:,1:k) * diag(sqrt(sigma(1:k)));
lambda_Ik = lambda * eye(k);
zk = zeros(k,1);

% Alternating least squares iteration
nstep = 10;
resid = zeros(1,nstep);
for step = 1:nstep

  resid(step) = norm(A-X*Y', 'fro') / norm(A, 'fro');

  %TODO: Run one alternating least squares sweep

end

% Plot
semilogy(resid);
