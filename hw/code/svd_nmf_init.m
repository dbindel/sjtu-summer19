% [W,H] = svd_nmf_init(U, S, V, k)
%
% SVD-based initialization for NMF (Boutsidis and Gallapoulos 2007).
% Given a rank k truncated SVD factorization (or approximation thereof),
% return a rank k approximate NMF W*H.
%
function [W,H] = svd_nmf_init(U, S, V, k)

sig = diag(S);
if nargin < 4,
  k = length(sig);
end

W = zeros(size(U,1), k);
H = zeros(k, size(V,2));

for j = 1:k
  x = U(:,j);  xp = x .* (x >= 0);  xn = -x .* (x <= 0);
  y = V(:,j);  yp = y .* (y >= 0);  yn = -y .* (y <= 0);
  norm_xp = norm(xp); norm_yp = norm(yp); norms_p = norm_xp*norm_yp;
  norm_xn = norm(xn); norm_yn = norm(yn); norms_n = norm_xn*norm_yn;
  if norms_p > norms_n
    scale = sqrt(sig(j) * norms_p);
    W(:,j) = scale * xp/norm_xp;
    H(j,:) = scale * yp'/norm_yp;
  else
    scale = sqrt(sig(j) * norms_p);
    W(:,j) = scale * xp/norm_xp;
    H(j,:) = scale * yp'/norm_yp;
  end
end
