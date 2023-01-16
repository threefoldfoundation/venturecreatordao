module api

import freeflowuniverse.spiderlib.api { FunctionCall, FunctionResponse }
import freeflowuniverse.spiderlib.uikit.elements
import freeflowuniverse.spiderlib.uikit.partials
import freeflowuniverse.spiderlib.uikit.shell
import freeflowuniverse.spiderlib.htmx
import os
import vweb

pub struct API {
	vweb.Context
	call_chan chan &FunctionCall [vweb_global]
	resp_chan chan &FunctionResponse [vweb_global]
}



pub fn run(call_chan chan FunctionCall, resp_chan chan FunctionResponse) {
	mut api := API{
		call_chan: call_chan
		resp_chan: resp_chan
	}
	println('ran:' + @FILE.all_before_last('/'))
	api.mount_static_folder_at(@FILE.all_before_last('/') + '/dist', '/dist')
	vweb.run(&api, 8080)
}

pub fn (mut api API) before_request() {
	// println(api.req)
}

// index is the home page of the website
pub fn (mut api API) index() vweb.Result {
	return $vweb.html()
}
