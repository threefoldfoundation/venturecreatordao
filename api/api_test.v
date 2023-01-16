module api

import freeflowuniverse.spiderlib.api

fn test_run() {
	call_chan := chan FunctionCall{cap: 100}
	resp_chan := chan FunctionResponse{cap: 100}
	run(call_chan, resp_chan)
}
