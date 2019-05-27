X      = randn(10,3);
[Q,R]  = qr(randn(3));
e      = ones(10,1);
Xh = X*Q + e*randn(1,3);

X      = X -e*mean(X, 1);
Xh     = Xh-e*mean(Xh,1);

[U,S,V] = svd(Xh'*X);
QQ = U*V';
Xh*QQ-X
