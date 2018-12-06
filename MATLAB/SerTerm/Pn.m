function Ps = Pn( Ns, N, P )
s = 0;
for k = Ns:N
    s = s + P^k * ( 1 - P )^( N - k ) * nchoosek( N, k );
end
Ps = s;
