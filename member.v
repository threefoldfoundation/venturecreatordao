module main

import time

struct Member {
	name string
mut:
	email string
	funds f64
}

struct InvestArgs {
mut:
	venture &Venture
	amount  f64
}

// invest creates a investment of the member in a venture by transferring some
// of their gold token holdings to the venture
pub fn (mut member Member) invest(mut args InvestArgs) !Investment {
	if member.funds < args.amount {
		return error('Failed to invest, not enough funds.')
	}

	// todo: handle token transfer
	member.funds -= args.amount
	args.venture.funds += args.amount

	return Investment{
		invested_at: time.now()
		stake: args.amount / args.venture.funds
		venture: args.venture
	}
}
