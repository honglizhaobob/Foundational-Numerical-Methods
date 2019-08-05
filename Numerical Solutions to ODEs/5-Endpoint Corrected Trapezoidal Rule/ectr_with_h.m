function w = ectr_with_h(n, k, h)
% implemented an h input
w = ones(1,n+1);
w(1) = 1/2;
Bm = calc_bm(10);
alphas = linspace(0,(k-2)*h,k-1);
if k>2
    for m1 = 3:2:k-1
        diff_coef = forn_matrix(m1-2,0,alphas);
        for m = 1:m1
            w(m)= w(m) - Bm(m1-2)*h^(m1+1)*diff_coef(m);
        end
    end
end
w1 = flip(w);
w2 = ones(1,n+1);
w3 = w1 + w - w2;
w = w3;
end