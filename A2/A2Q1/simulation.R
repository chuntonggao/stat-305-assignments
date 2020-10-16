set.seed(3052020)
sink("simulation.txt")

n = 100
theta = 5
theta1Samples = c()
theta2Samples = c()
numSamples = 10000

for (i in 1:numSamples) {
    sample = runif(n, 0, theta)
    theta1Samples[i] = 2 * sum(sample) / n
    theta2Samples[i] = max(sample)
}

cat("mean of theta1Samples: ", mean(theta1Samples), "\n") 
cat("variance of theta1Samples: ", var(theta1Samples), "\n") 
cat("theoretical mean obtained from E(theta1): ", theta, "\n")
cat("theoretical variance obtained from Var(theta1): ", theta ^ 2 / (3 * n), "\n")
cat("======", "\n")

cat("mean of theta2Samples: ", mean(theta2Samples), "\n") 
cat("variance of theta2Samples: ", var(theta2Samples), "\n") 
cat("======", "\n")

realTheta = rep(theta, numSamples)
mse1 = sum((theta1Samples - realTheta) ^ 2) / numSamples
mse2 = sum((theta2Samples - realTheta) ^ 2) / numSamples

cat("approximation of mse(theta1): ", mse1, "\n")
cat("approximation of mse(theta2): ", mse2, "\n")

sink()