module app

import rand
import time

pub fn mock_venture() Venture {
	return Venture{
		id: rand.uuid_v4()
		title: 'OurParadise'
	}
}

// creates a random mock user instance
pub fn mock_user() User {

	venture := mock_venture()
	portfolio := Portfolio{
		ventures: [
			VentureAsset{
				venture: venture
				amount: 265.4
			},
		]
	} 

	return User{
		id: rand.uuid_v4()
		investments: [
				Investment{
					created_at: time.now()
					venture: venture
				},
				Investment{
					created_at: time.now()
					venture: venture
				},
				Investment{
					created_at: time.now()
					venture: venture
				},
			]
		portfolio: portfolio
	}
}


pub fn mock_venture_creator() VentureCreatorDAO {
	venture := mock_venture()
	user := mock_user()

	return VentureCreatorDAO{
		users: {
			user.id: user
		}
		ventures: {
			venture.id: venture
		}
	}
}
