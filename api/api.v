module api

import vweb

struct API {
	vweb.Context
}

pub fn (api API) run() {
	vweb.run(api, 8000)
}
