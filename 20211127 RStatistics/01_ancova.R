### General Linear Models
# lm    : linear model
# anova : anaylysis of variance;
# ancova: analysis of covariance; mix of lm and anova;

### covariance vs contravariance vs univariance
# covariance    : base <- derived;
# contravariance: base -> derived;

### ancova in R
# using  lm
# using aov(dependent ~ independent * factor, data=data_frame), when significant;
# using aov(dependent ~ independent + factor, data=data_frame), when not significant; + symbol will test the effect of the independent variable and categorical factor;

### logit transformation
# logit: f(x) = 1/(1+e^(-x))
# purpose: mapping, (-∞, ∞) to (0, 1)

### OR(odds ratio)
# odds: diff
# ratio: proportion
# given group, property A vs property B
# OR = odds(outcome given x+1) / odds(outcome given x)
# glm in R
# glm(dependent ~ independent, family="binomial", data=data_frame)

