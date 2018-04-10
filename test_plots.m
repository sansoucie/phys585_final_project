counter = 1;

figure(1);
clf;

for i=[100, 500, 1000, 5000]
    outs = svm_test(1e-5, 50, 0.5, 2, i);

    w = outs{1};
    data = outs{2};
    labels = outs{3};
    preds = outs{4};
    corrects = outs{5};
    incorrects = outs{6};
    pred_slope = outs{7};
    pred_intercept = outs{8};
    
    
    subplot(2,2,counter);
    plot(corrects(1,:),corrects(2,:),'.b');
    hold on;
    plot(incorrects(1,:),incorrects(2,:),'.r');
    plot(-10:10,test_slope*(-10:10)+test_intercept,'k','LineWidth',4);
    plot(-10:10,pred_slope*(-10:10)+pred_intercept,'g.-','LineWidth',2);
    xlim([-10,10])
    ylim([-10,10])
    
    counter = counter + 1;
    
end

counter = 1;

figure(2);
clf;

for i=[1e-1, 1e-2,1e-3,1e-4,1e-5,1e-6,1e-7,1e-8,1e-9]
    outs = svm_test(i, 50, 0.5, 2, 5000);

    w = outs{1};
    data = outs{2};
    labels = outs{3};
    preds = outs{4};
    corrects = outs{5};
    incorrects = outs{6};
    pred_slope = outs{7};
    pred_intercept = outs{8};
    
    
    subplot(3,3,counter);
    plot(corrects(1,:),corrects(2,:),'.b');
    hold on;
    plot(incorrects(1,:),incorrects(2,:),'.r');
    plot(-10:10,test_slope*(-10:10)+test_intercept,'k','LineWidth',4);
    plot(-10:10,pred_slope*(-10:10)+pred_intercept,'g.-','LineWidth',2);
    xlim([-10,10])
    ylim([-10,10])
    
    counter = counter + 1;
    
end


