library(Rcpp)

sourceCpp("src/dist_matrix.cpp")

# test JS -----------------------------------------------------------------

# test if 0s lead to NaN
jensen_shannon(c(1, 0), c(0.5, 0.5), FALSE, "log2")
jensen_shannon(c(0.5, 0.5), c(1, 0), FALSE, "log2")

# test if test.NA works
jensen_shannon(c(1, 0), c(NA, 1), testNA = TRUE, "log2")

# test JS matrix ----------------------------------------------------------

DistMatrixWithUnitMAT(cbind(c(0.3, 0.3, 0.4), c(1, 0, 0)), jensen_shannon,
                      FALSE, "log2")

# test other JS -----------------------------------------------------------

jensen_difference(c(1, 0), c(0.5, 0.5), FALSE, "log2")
jensen_difference(c(0.5, 0.5), c(1, 0), FALSE, "log2")

# test if test.NA works
jensen_difference(c(1, 0), c(NA, 1), testNA = TRUE, "log2")
