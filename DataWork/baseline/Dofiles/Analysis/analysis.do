* This dofile is for analying the cleaned census data.

	use "${baseline_dtInt}/analysis_census.dta" , clear

	sum
	codebook, compact

	scatter pop medage
	codebook, compact
	
	describe
	




* Have a lovely day!
