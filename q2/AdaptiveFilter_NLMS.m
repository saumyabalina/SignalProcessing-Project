function [e,y,w] = AdaptiveFilter_NLMS(x,d,N,f_order,beta)

y = zeros(N,1);
w = zeros(f_order,1);
e = zeros(N,1);
U = zeros(f_order,1);

for i = 1:N
    U = [d(i)
    U(1:(f_order-1))];
    x_n = x(i);

    temp = w' * U;
    y(i) = y(i) + temp;
    E = x_n - temp;
    e(i) = e(i)+E;
    if(norm(U) ~= 0)
        w = (w + ((beta/((norm(U)^2)))*conj(E)*U));
    end
end