module api

import freeflowuniverse.spiderlib.api { FunctionCall, FunctionResponse }
import vweb

pub fn (mut api API) get_ventures() vweb.Result {
	println('trigger')
	api.call_chan <- &FunctionCall{
		function: 'get_ventures'
	}
	for {
		resp := <-api.resp_chan
		return api.html(resp.payload)
	}
	return api.html('no response')
}
