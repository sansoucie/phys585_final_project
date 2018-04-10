function out=svm_test(test_lambda, test_batch_size, test_slope, ...
                      test_intercept,iters)
w = zeros(iters+1,3);
all_data = zeros(2,test_batch_size*iters);
out = cell(8,1);

for t=1:iters
    data = (rand(2,test_batch_size)-0.5)*20;
    data_augmented = [data;ones(1,test_batch_size)];
    all_data(:,(t-1)*test_batch_size+1:t*test_batch_size) = data;
    labels = 2*(data(2,:) > test_slope * data(1,:) + test_intercept)-1;
    w(1+t,:) = svm_update(w(t,:), data_augmented, labels, test_lambda, t);
end

all_labels = 2*(all_data(2,:)>test_slope*all_data(1,:)+test_intercept)-1;
all_data_augmented = [all_data;ones(1,length(all_data))];
all_preds = w(1+iters,:) * all_data_augmented;
corrects = all_data(:,sign(all_labels) == sign(all_preds));
incorrects = all_data(:,sign(all_labels) ~= sign(all_preds));

pred_slope = -1*w(1+iters,1)/w(1+iters,2);
pred_intercept = -1*w(1+iters,3)/w(1+iters,2);

out(1) = w(1+iters);
out(2) = all_data;
out(3) = all_labels;
out(4) = all_preds;
out(5) = corrects;
out(6) = incorrects;
out(7) = pred_slope;
out(8) = pred_intercept;
end
