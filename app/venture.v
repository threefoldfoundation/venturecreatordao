module app

import time

pub fn (venture Venture) get_activities() []IActivity {
	mut activities := []IActivity{}
	for meeting in venture.meetings {
		activities << IActivity(meeting)
	}
	return activities
}