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
pub:
	call_chan chan &FunctionCall     [vweb_global]
	resp_chan chan &FunctionResponse [vweb_global]
}

pub fn new_api() &API {
	mut api := &API{
		call_chan: chan &FunctionCall{cap: 100}
		resp_chan: chan &FunctionResponse{cap: 100}
	}
	api.mount_static_folder_at(@FILE.all_before_last('/') + '/dist', '/dist')
	return api
}

pub fn run(api API) {
	vweb.run(&api, 8080)
}

pub fn (mut api API) before_request() {
	// println(api.req)
}

// index is the home page of the website
pub fn (mut api API) index() vweb.Result {
	return $vweb.html()
}
