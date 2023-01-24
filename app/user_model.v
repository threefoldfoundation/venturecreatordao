module app

import time
import arrays

// User defines any user of the venture creator dao application
// Owns user info, a portfolio for investments, and gold tokens to invest with
pub struct User {
	id   string
	name string
pub mut:
	investments []Investment
	portfolio Portfolio
	email     string
	funds     f64
}

// Portfolio holds lists of assets in each asset category
[noinit]
struct Portfolio {
	pub mut:
	ventures []VentureAsset
	currencies  []Currency
	validators  []Validator
	value f64
}

struct VentureAsset {
	pub:
	venture Venture
	amount f64
}

// Investment is a stake held in a venture
[heap]
struct Investment {
	created_at time.Time
	stake   f64
	venture Venture
}

struct Currency {}

struct Validator {}

struct InvestArgs {
mut:
	venture &Venture
	amount  f64
}
