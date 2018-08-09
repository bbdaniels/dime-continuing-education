* This dofile is for cleaning the census data.

	use "${baseline_dtInt}/census.dta" , clear

	expand 5 // <- set up synthetic panel







	save "${baseline_dtInt}/analysis_census.dta" , replace

* Have a lovely day!
