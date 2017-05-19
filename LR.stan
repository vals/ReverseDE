data {
  int<lower=0> N;
  int<lower=0> G;
  matrix[N, G] X;
  real y[N];
}
parameters {
  real beta0;
  vector[G] beta;
  real<lower=0> sigma;
}
model {
  
  beta ~ normal(0, 1.);
  beta0 ~ normal(0, 1.);

  y ~ normal(beta0 + X * beta, sigma);
}
