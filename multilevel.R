# Multilevel Regression Model
# https://rpubs.com/rslbliss/r_mlm_ws

# Read in data
library(haven)
mlmdata <- read_dta("https://stats.idre.ucla.edu/stat/examples/imm/imm10.dta")
head(mlmdata)

# Load package
install.packages("lme4")
library(lme4)

# Run random intercept model
model <- lmer(math ~ homework + (1 | schid), data=mlmdata)

# View summary of results
summary(model)

# Run random intercept and slope model
model <- lmer(math ~ homework + (1 + homework | schid), data=mlmdata)
summary(model)

# Run random slope model
model <- lmer(math ~ homework + (homework | schid), data=mlmdata)
summary(model)

# Run random slope model
model <- lmer(math ~ homework + (0 + homework | schid), data=mlmdata)
summary(model)

# Run random intercept and slope model
model <- lmer(math ~ homework + (1 | schid) + (0 + homework | schid), data=mlmdata)
summary(model)
