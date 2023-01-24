module app

import time

[noinit]
struct Venture {
	id string [required]
pub mut:
	title       string
	description string
	category    VentureCategory
	links       map[string]string
	value       f64
	// value_history map[i64]f64
	funds f64
	meetings []Meeting
}

enum VentureCategory {
	internet
}

[heap]
pub struct Meeting {
	created_at time.Time
	time time.Time
}
