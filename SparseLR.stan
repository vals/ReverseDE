data {
  int<lower=0> N;
  int<lower=0> G;
  matrix[N, G] X;
  real y[N];
}
parameters {
  real beta0;
  vector[G] beta;
  vector<lower=0>[G] lambda;
  real<lower=0> tau;
  real<lower=0> sigma;
}
model {
  lambda ~ cauchy(0, 1);
  tau ~ cauchy(0, 1);
  for (i in 1:G) {
    beta[i] ~ normal(0, lambda[i] * tau);
  }

  beta0 ~ normal(0, 1.);

  y ~ normal(beta0 + X * beta, sigma);
}
