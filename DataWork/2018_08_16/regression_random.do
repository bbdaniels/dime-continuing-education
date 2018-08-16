* Let's show that a regression is a random variable!


* Iterations loop

	set matsize 5000

	cap mat drop x1b
	 forvalues it = 1/1000 {

		clear
		set obs 100

		* Covariates

			gen x1 = rnormal()
			gen x2 = rnormal()

		* DGP

			gen y  = 3 + 5*x1 + -1*x2 + rnormal()

		* Run the regression!

			reg y x1 x2
-
			mat x1b = nullmat(x1b) \ _b[x1]

	}

* Histogram

	clear
	svmat x1b

* Have a lovely day!
