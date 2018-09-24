def divide(b,a):
    '''
    if there exits a k, s.t. a = k*b then b divides a
    a | b if any for some k, b=k*a
    '''
    for k in range(1,b+1):
        if b == a*k:
            return True, k
    return False, None

def condition(x):
    x_divisible_by_2, k = divide(2,x)
    if k != None:
        k_divisible_by_2, kp = divide(2,k)
    return x_divisible_by_2 and k_divisible_by_2

def condition2(x):
    divisors_x = [ k for k in range(1,x) if x % k == 0 and k != 1 ]
    #print(divisors_x)
    invariant = x % 2 == 0
    #print(f'invariant = {invariant}')
    for k in divisors_x:
        #print(k)
        two_div_k = k % 2 == 0
        #print(f'two_div_k = {two_div_k}')
        invariant = invariant and two_div_k
    return invariant

def count(n):
    for x in range(0,n+1):
        #print(f'--- x = {x}')
        if condition2(x):
            print(x)

count(n=100)
#print(f'condition2(4) = {condition2(4)}')
#print(f'condition2(8) = {condition2(8)}')
