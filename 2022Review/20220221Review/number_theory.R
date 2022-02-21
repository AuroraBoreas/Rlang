# number theory review 20220221 @ZL

# preliminary
## well-ordering principle
## S = {a}, there are integers a <= b for all b's belonging to S;
## where a, b, S ∈ unsigned

## Archimedean property
## na >= b, a, b, n ∈ unsigned;

## ~~ domino modeling ~~
## the first principle of mathematics introduction
## S = {1,...,k,k+1,...}
## (a) 1 ∈ S => TRUE
## (b) if k ∈ S, then k+1 must ∈ S => TRUE

## the second principle of mathematics introduction
## S = {1,2,3,4,5,..., k, k+1, ...}
## (a) 1 ∈ S => TRUE
## (b') if k is a positive integer such that 1,2,...k belongs to S, then k+1 must belong to S;


# divisibility
## euclidean algorithm: a, b, q, r ∈ Unsigned, a = qb + r, where 0 <= r < |r|
## gcd: gcd(a, b) = gcd(b, a-b) = gcd(b, r), where r = a `mod` b
## lcm: lcm(a, b) = ab / gcd(a, b)
## Bernoulli inequality: (1 + x)^n >= 1 + nx, where n, x ∈ unsigned


# primes
## what: n > 1, d | n ∈ {1, x}
## pascal law
## (n k) = n! / [k!(n-k)!]
## (n 0) == (n n) == 1
## (n k) + (n k-1) == (n+1 k), where k ∈ [1, n]
## binary and decimal distribution
## (a + b)^n = Σ(n k)a^(n-k)b^k, where k ∈ [0, n] 
## P(x) = Σaix^i, where i ∈ unsigned
## property
## T = a0 + a1 + ... + am, S = P(10), if and only if 9|T, then 9|S;
## T = a0 - a1 + ... + am, S = P(10), if and only if 11|T, then 11|S;
## if a ≡ b (mod n), P(a) ≡ P(b) (mod n)


# Congruence theory
## what: a ≡ b (mod n), a, b, n ∈ unsigned
## congruence theorem, where a, b, c, d, n ∈ unsigned
## (a) a ≡ a (mod n)
## (b) a ≡ b (mod n), b ≡ a (mod n)
## (c) a ≡ b (mod n), b ≡ c (mod n), then a ≡ c (mod n)
## (d) a ≡ b (mod n), na ≡ nb (mod n)
## (e) a ≡ b (mod n), c ≡ d (mod n), then ac ≡ bd (mod n) and a+c ≡ b+d (mod n)
## (f) a ≡ b (mod n), a^k ≡ b^k (mod n)


# Fermat
## Fermat theory: a^(p-1) ≡ 1 (mod p), a ~|p, a ∈ unsigned, p ∈ prime 
## Wilson theory: (p-1)! ≡ -1 (mod p), p ∈ unsigned
## corollary: a^p ≡ a (mod p), a~|p, a ∈ unsigned, p ∈ prime


# number-theoretic function
## what: n = p1^k1 p2^k2 ... pr^kr, n > 1
## then d = p1^a1 p2^a2 ... pr^ar, where 0 <= ai <= ki
## it is exactly the same form
## property
## τ(n) = Σ1, where d|n == Π(ki+1), where 1 <= i <= r
## σ(n) = Σd, where d|n == Π([pi^(ki+1)-1]/[pi-1]), where 1 <= i <= r

# quadratic-reciprocity law
## what: 
