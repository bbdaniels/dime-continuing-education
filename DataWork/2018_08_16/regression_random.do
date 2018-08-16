* Let's show that a regression is a random variable!

*iteration loops 
 
 cap mat drop x1b
 
forvalues it = 1/1000 {

 clear 
 
 set obs 100 
 
 
 
 *covariates
 gen x1 = rnormal()
 gen x2 = rnormal()
 
 *data generating process - 
 
 gen y = 3+ 5*x1 + -1 * x2  + rnormal()


 *create matrix
 
 reg y x1 x2 
 mat x1b = nullmat(x1b)\_b[x1]
 
 
 }
 *set the observation column from 1-100
 
 * create histogram  --> matrix of coefficient on x1
 
 clear
 svmat x1b



hist x1b1


* Have a lovely day!
