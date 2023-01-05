module main

import time

struct VentureCreatorDAO {
	ventures map[string]Venture
	members  map[string]Member
}

// new venture creates new venture
pub fn (dao VentureCreatorDAO) create_venture(venture Venture) Venture {
	return venture
}

// get venture returns venture given a venture id, or none if doesn't exist
pub fn (dao VentureCreatorDAO) get_venture(id string) ?Venture {
	if dao.ventures.keys().contains(id) {
		return dao.ventures[id]
	}
	return none
}

// get venture returns venture given a venture id, or none if doesn't exist
pub fn (dao VentureCreatorDAO) get_ventures() []Venture {
	return dao.ventures.values()
}

// new venture creates new venture
pub fn (dao VentureCreatorDAO) create_member(name string) Member {
	return Member{}
}

// get venture returns venture given a venture id, or none if doesn't exist
pub fn (dao VentureCreatorDAO) get_member(id string) ?Member {
	if dao.ventures.keys().contains(id) {
		return dao.members[id]
	}
	return none
}

// fn ()run() {

// 	dao.load_ventures()
// 	dao.load_members()
// 	dao.run()
// }
