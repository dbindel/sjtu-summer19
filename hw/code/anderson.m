% [xnew] = anderson(X, G)
%
% Apply Anderson acceleration to the fixed point iteration
%   xnew = g(x)
% given a history X = [x(k-m), ..., x(k)] and
% corresponding evaluations [G(x(k-m)), ..., G(x(k))].
% Returns the new point xnew = x(k+1).
%
function [xnew] = anderson(X, G)

  % Ref: Homer F. Walker and Peng Ni,
  % "Anderson Acceleration for Fixed-Point Iterations"
  % https://doi.org/10.1137/10078356X
  %
  % NB: This all could be done a bit more efficiently by an update
  %     scheme.  In the interest of clarity, though, we're not
  %     going to bother.

  F  = G-X;
  DF = F(:,2:end)-F(:,1:end-1);
  DG = G(:,2:end)-G(:,1:end-1);
  fk = F(:,end);
  xnew = G(:,end)-DG*(DF\fk);
