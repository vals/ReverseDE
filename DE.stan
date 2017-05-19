data {
  int<lower=0> N;
  int<lower=0> G;
  matrix[N, G] X;
  vector[N] y;
}
parameters {
  vector[G] beta0;
  vector[G] beta;
  real<lower=0> sigma[G];
}
model {
  
  beta ~ normal(0, 1.);
  beta0 ~ normal(0, 1.);

  for (i in 1:G) {
    col(X, i) ~ normal(beta0[i] + y * beta[i], sigma[i]);
  }

}
