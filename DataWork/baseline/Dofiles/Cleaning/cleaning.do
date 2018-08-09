* This dofile is for cleaning the census data.

	use "${baseline_dtInt}/census.dta" , clear

	expand 5 // <- set up synthetic panel
		bys state : gen period = _n

		sort state period

	save "${baseline_dtInt}/analysis_census.dta" , replace

* Have a lovely day!
