module app

import time

pub struct VentureCreatorDAO {
	ventures map[string]Venture
	users    map[string]User
}

// new venture creates new venture
pub fn (dao VentureCreatorDAO) create_venture(venture Venture) Venture {
	return venture
}

// get venture returns venture given a venture id, or none if doesn't exist
pub fn (dao VentureCreatorDAO) get_ventures() []Venture {
	return dao.ventures.values()
}

// get venture returns venture given a venture id, or none if doesn't exist
pub fn (dao VentureCreatorDAO) get_venture(id string) ?Venture {
	if dao.ventures.keys().contains(id) {
		return dao.ventures[id]
	}
	return none
}

// get venture returns venture given a venture id, or none if doesn't exist
pub fn (dao VentureCreatorDAO) update_venture(venture Venture) []Venture {
	return dao.ventures.values()
}

// // get venture returns venture given a venture id, or none if doesn't exist
// pub fn (dao VentureCreatorDAO) get_portfolio() []Venture {
// 	// todo: currently hardcoded
// }

// new venture creates new venture
pub fn (dao VentureCreatorDAO) create_user(name string) User {
	return User{}
}

// get venture returns venture given a venture id, or none if doesn't exist
pub fn (dao VentureCreatorDAO) get_user(id string) ?User {
	if dao.ventures.keys().contains(id) {
		return dao.users[id]
	}
	return none
}

// get venture returns venture given a venture id, or none if doesn't exist
pub fn (dao VentureCreatorDAO) get_activities() []IActivity {
	mut activities := []IActivity{}
	for _, venture in dao.ventures {
		activities << venture.get_activities()
	}
	for _, user in dao.users {
		activities << user.get_activities()
	}
	return activities
}

// fn ()run() {

// 	dao.load_ventures()
// 	dao.load_users()
// 	dao.run()
// }
