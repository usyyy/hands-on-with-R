wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")

# create a data frame with all wheel combinations along with their respective probabilites
combos <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)
combos
probs <- c("DD" = 0.03, "7" = 0.03, "BBB" = 0.06, "BB" = 0.1,
           "B" = 0.25, "C" = 0.01, "0" = 0.52)

combos$prob1 <- probs[combos$Var1]
combos$prob2 <- probs[combos$Var2]
combos$prob3 <- probs[combos$Var3]

# probability of each combination
combos$prob <- combos$prob1 * combos$prob2 * combos$prob3

sum(combos$prob) # test to see if the probabilities summed to 1

# determine the prize for each combo

combos$prize <- NA

for (i in 1:nrow(combos)) {
  symbols <- c(combos[i, 1], combos[i, 2], combos[i, 3])
  combos$prize[i] <- score(symbols)
}

# expected value of the prize

sum(combos$prize * combos$prob) # 0.54 (2 d.p)
