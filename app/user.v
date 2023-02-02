module app

import time
import arrays

//
fn (mut user User) get_user() User {
	return user
}

fn (user User) get_activities() []IActivity {
	mut activities := []IActivity{}
	for investment in user.investments {
		activities << IActivity(investment)
	}
	return activities
}

// // returns the ventures in a portfolio
// pub fn (mut portfolio Portfolio) get_ventures() []VentureAddr {
// 	return user.portfolio.investments.map(it.venture)
// }

// invest creates a investment of the user in a venture by transferring some
// of their gold token holdings to the venture
pub fn (mut user User) invest(mut args InvestArgs) !Investment {
	if user.funds < args.amount {
		return error('Failed to invest, not enough funds.')
	}

	// todo: handle token transfer
	user.funds -= args.amount
	args.venture.funds += args.amount

	return Investment{
		// invested_at: time.now()
		stake: args.amount / args.venture.funds
		venture: args.venture
	}
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

//
pub fn (i Investment) get_value() f64 {
	return i.stake * i.venture.value
}

pub fn (p Portfolio) get_value() f64 {
	// val_assets := p.assets.map(it.currency.value * it.amount).sum()
	val_investments := arrays.sum[f64](
		p.ventures.map(it.venture.value * it.amount)
	) or { 0 }
	return val_investments
}

// get portfolio returns the users portfolio
pub fn (u User) get_portfolio() Portfolio {
	// val_assets := p.assets.map(it.currency.value * it.amount).sum()
	
	mut p := Portfolio{}

	for i in u.investments {
		if !p.ventures.any(it.venture == i.venture) {
			p.ventures << VentureAsset{
				venture: i.venture
			}
		}

		// get list item matching 
		// p.ventures.filter(it.venture.id == )
		// p.ventures.amount += i.stake
	}

	return p
}

pub fn (p Portfolio) get_delta() f64 {
	return 1.4
}

// pub fn (p Portfolio) get_history(period time.Time) map[i64] {
// 	return

// }
