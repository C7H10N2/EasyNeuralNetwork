%训练集
train = [1 0 0; 0 1 0; 1 0 1; 1 1 1];   %输入
ans = [0; 1; 1; 0]; %结果

%初始化权重
l0 = train;
w0 = rand (3,10).*2 - 1;
w1 = rand (10,1).*2 - 1;

%训练
for i = 0:1000 %轮数
    [l1,l2]= fp (l0, w0, w1); 
    [l0_delta, l1_delta] = bp (ans, l1, l2, w1);
    w0 = w0 + (l0') * l0_delta;
    w1 = w1 + (l1') * l1_delta;
end

%预测
pr = [0 1 1]; %测试输入
[l1,l2] = fp(pr ,w0 ,w1);
l2