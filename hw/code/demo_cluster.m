% Generate cluster data
centers = randn(5,3);
e10     = ones(1,10);
A       = [centers(:,1)*e10, centers(:,2)*e10, centers(:,3)*e10];
An      = A + 0.2*randn(size(A));

% Compute an economy pivoted QR decomposition of the data matrix
[Q,R,P] = qr(An,0);

% Exercise: attempt to recover the cluster labels via the QR
