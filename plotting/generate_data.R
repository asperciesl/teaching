expression <- data.frame("Cell.Line" = character(), "Vector" = character(),
                         "Protein" = character(), "Expression" = numeric(),
                         stringsAsFactors = FALSE)
per_group = 6
n = 6
s = 1
e = s + per_group - 1
expression[s:e,"Cell.Line"] = "MDA-MB-231"
expression[s:e,"Vector"] = "EVC"
expression[s:e,"Protein"] = "Protein_A"
expression[s:e,"Expression"] = rnorm(n = n, mean = 4, sd = 0.3)
expression[s:e,"Rep"] = 1:6

s = e+1
e = s + per_group - 1

expression[s:e,"Cell.Line"] = "MDA-MB-231"
expression[s:e,"Vector"] = "PGRMC1"
expression[s:e,"Protein"] = "Protein_A"
expression[s:e,"Expression"] = rnorm(n = n, mean = 5, sd = 0.3)
expression[s:e,"Rep"] = 1:6

s = e+1
e = s + per_group - 1

expression[s:e,"Cell.Line"] = "T47D"
expression[s:e,"Vector"] = "EVC"
expression[s:e,"Protein"] = "Protein_A"
expression[s:e,"Expression"] = rnorm(n = n, mean = 2, sd = 0.3)
expression[s:e,"Rep"] = 1:6

s = e+1
e = s + per_group - 1

expression[s:e,"Cell.Line"] = "T47D"
expression[s:e,"Vector"] = "PGRMC1"
expression[s:e,"Protein"] = "Protein_A"
expression[s:e,"Expression"] = rnorm(n = n, mean = 3.5, sd = 0.3)
expression[s:e,"Rep"] = 1:6


# Protein B #  

s = e+1
e = s + per_group - 1
expression[s:e,"Cell.Line"] = "MDA-MB-231"
expression[s:e,"Vector"] = "EVC"
expression[s:e,"Protein"] = "Protein_B"
expression[s:e,"Expression"] = rnorm(n = n, mean = 3, sd = 0.5)
expression[s:e,"Rep"] = 1:6

s = e+1
e = s + per_group - 1

expression[s:e,"Cell.Line"] = "MDA-MB-231"
expression[s:e,"Vector"] = "PGRMC1"
expression[s:e,"Protein"] = "Protein_B"
expression[s:e,"Expression"] = rnorm(n = n, mean = 1, sd = 0.5)
expression[s:e,"Rep"] = 1:6

s = e+1
e = s + per_group - 1

expression[s:e,"Cell.Line"] = "T47D"
expression[s:e,"Vector"] = "EVC"
expression[s:e,"Protein"] = "Protein_B"
expression[s:e,"Expression"] = rnorm(n = n, mean = 4, sd = 0.5)
expression[s:e,"Rep"] = 1:6

s = e+1
e = s + per_group - 1

expression[s:e,"Cell.Line"] = "T47D"
expression[s:e,"Vector"] = "PGRMC1"
expression[s:e,"Protein"] = "Protein_B"
expression[s:e,"Expression"] = rnorm(n = n, mean = 4.3, sd = 0.5)
expression[s:e,"Rep"] = 1:6

write.csv(expression, file="csv/expression.csv", row.names = FALSE)
