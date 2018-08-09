* This dofile is for analying the cleaned census data.

	use "${baseline_dtInt}/analysis_census.dta" , clear

	sum
	codebook, compact

	scatter pop medage
	codebook, compact

	tab


* Have a lovely day!
