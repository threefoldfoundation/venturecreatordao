module api

import freeflowuniverse.spiderlib.api { FunctionCall }
import vweb

pub fn (mut api API) get_portfolio() vweb.Result {
	api.call_chan <- &FunctionCall{
		function: 'get_portfolio'
	}
	response := <- api.resp_chan
	return api.text(response.payload)
}
