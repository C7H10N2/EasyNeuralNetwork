from numpy import random,dot,exp,array

def fp(input):
    l1 = 1/(1+exp(-dot(input, w0)))
    l2 = 1/(1+exp(-dot(l1, w1)))
    return l1,l2

def bp(y, l1, l2):
    error = y - l2#error
    slpoe = l2 * (1 - l2)#slope
    l1_delta = error * slpoe #delta
     
    l0_error = l1_delta.dot(w1.T)#error
    l0_slpoe = l1 * (1 - l1)#slope
    l0_delta = l0_error * l0_slpoe #delta
    return l0_delta, l1_delta

#improt raw data
X = array([ [0,0,1],
            [0,1,1],
            [1,0,1],
            [1,1,1]])
y = array([[0,0,1,1]]).T
l0 = X
#initialize the weights
random.seed(1)
w0 = random.random((3,10)) * 2 - 1 #Random 0-1 mapping to (-1)-1
w1 = random.random((10,1)) * 2 - 1 

for it in range(10000): 
    l1,l2 = fp(l0)
    l0_delta, l1_delta = bp(y,l1,l2)
    w0 = w0 + dot(l0.T, l0_delta)
    w1 = w1 + dot(l1.T, l1_delta)

    
#predicted
print(fp([[1,0,0]])[1])