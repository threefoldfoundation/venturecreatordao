module main

import threefoldfoundation.venturecreatordao.api as api2
import freeflowuniverse.spiderlib.api

fn main() {
	call_chan := chan FunctionCall{cap: 100}
	resp_chan := chan FunctionResponse{cap: 100}
	api2.run(call_chan, resp_chan)
}
