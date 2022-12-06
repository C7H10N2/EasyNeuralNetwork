function [l0_delta, l1_delta] = bp(y, l1, l2, w1) %逆向传播
    err = y - l2;   %误差
    slope = l2 .* (1-l2);   %斜率
    l1_delta = err .* slope; %步进距离

    %同上
    l0_err = l1_delta * w1';
    l0_slope = l1 .* (1-l1);
    l0_delta = l0_err .* l0_slope;
end