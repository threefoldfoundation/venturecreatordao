module api

import freeflowuniverse.spiderlib.api { FunctionCall }
import vweb

pub fn (mut api API) get_ventures() vweb.Result {
	api.call_chan <- &FunctionCall{
		function: 'get_ventures'
	}
	for {
		resp := <-api.resp_chan
		return api.html(resp.payload)
	}
	return api.html('no response')
}
