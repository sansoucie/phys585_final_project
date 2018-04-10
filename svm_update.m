function out=svm_update(w_t, A_t, y, lambda, t)
% Data should be one column = one data point
% w should be row vector of hyperplane coefficients
% labels should be row vector of labels
[d,k] = size(A_t);
A_t_plus = A_t(:,w_t*(A_t.*y)<1);
y_plus = y(w_t*(A_t.*y)<1);
eta_t = 1.0/(lambda*t);
if isempty(y_plus)
    out = w_t;
else
    w_t_half = (1-eta_t*lambda)*w_t+(eta_t/k)*sum(y_plus.*A_t_plus,2)';
    out = min(1.0, (1/sqrt(lambda))/norm(w_t_half)) * w_t_half;
end
end