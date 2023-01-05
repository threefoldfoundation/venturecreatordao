module main

import arrays
import time

[noinit]
struct Portfolio {
	investments []Investment
}

pub fn (p Portfolio) get_value() f64 {
	// val_assets := p.assets.map(it.currency.value * it.amount).sum()
	val_investments := arrays.sum[f64](p.investments.map(it.venture.value * it.stake)) or {
		0
	}
	return val_investments
}

// pub fn (p Portfolio) get_history(period time.Time) map[i64] {
// 	return

// }
