module app

import time
import arrays

// User in venturecreator, holds info, portfolio, funds
pub struct User {
	id   string // TFConnect identifier
	name string
	email string
pub mut:
	transactions Transaction
	portfolio Portfolio // holds investments
	funds     f64	// gold tokens
}

// Portfolio holds lists of investments for each asset
[noinit]
struct Portfolio {
pub mut:
	ventures []Investment
	currencies  []Investment
	validators  []Investment
	value f64 // total value, calculated with getter
}

type Asset = Venture | Currency | Validator | Liquidity

// Investment is an ownership of units in an asset
[heap]
struct Investment {
	created_at time.Time
	stake   f64
	asset Asset
}

enum Currency {}

struct Validator {}

struct InvestArgs {
mut:
	venture &Venture
	amount  f64
}
