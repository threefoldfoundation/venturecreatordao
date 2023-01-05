module main

import time

[noinit]
struct Venture {
mut:
	title         string
	description   string
	category      VentureCategory
	links         map[string]string
	value         f64
	// value_history map[i64]f64
	funds         f64
}

enum VentureCategory {
	internet
}
