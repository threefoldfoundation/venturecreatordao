module main

import maps
import time { Time }

struct Investment {
	invested_at Time
	stake       f64
	venture     Venture
}

pub fn (i Investment) get_value() f64 {
	return i.stake * i.venture.value
}

// // get history returns the
// pub fn (i Investment) get_history(period Time) map[i64]f64 {
// 	// filter value history by given period
// 	price_history := maps.filter[i64, f64](i.venture.value_history, fn [period] (k i64, v f64) bool {
// 		return k > time.now().unix - period.unix // history within period range
// 	})

// 	// multiply prices with stake
// 	mut value_history := map[i64]f64{}
// 	for k, v in price_history {
// 		value_history[k] = v * i.stake
// 	}

// 	return value_history
// }
