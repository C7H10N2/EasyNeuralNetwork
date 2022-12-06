function [l1, l2] = fp(input, w0, w1) %正向传播 sigmoid激活
    l1 = 1./(1+exp(1).^(input * w0 .* (-1) ) ); 
    l2 = 1./(1+exp(1).^(l1 * w1.*(-1)));
end