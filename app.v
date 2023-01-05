module main

import api
import json
import freeflowuniverse.spiderlib.api {FunctionCall, FunctionResponse}
import webui

fn main() {

	// function call and response channels for communication between app and api
	call_chan:= chan FunctionCall{cap: 100}
	resp_chan:= chan FunctionResponse{cap: 100}

	// application running businness logic etc.
	dao := VentureCreatorDAO{}

	// run web app user interface with messaging channels 
	spawn webui.run(call_chan, resp_chan)

	for {
		call := <-call_chan

		mut resp := FunctionResponse{
			thread_id: call.thread_id
			function: call.function
		}

		match call.function {
			'get_ventures' {
				ventures := dao.get_ventures()
				resp.payload = json.encode(ventures)
			}
			'invest' {
				mut member := dao.get_member(call.user_id) or {
					println('Failed to decode function call payload: ${call}')
					continue
				}
				mut venture := dao.get_venture(call.payload) or {
					println('Failed to decode function call payload: ${call}')
					continue
				}
				mut args := json.decode(InvestArgs, call.payload) or {
					println('Failed to decode function call payload: ${call}')
					continue
				}
				investment := member.invest(mut args) or {
					println('Failed to decode function call payload: ${call}')
					continue
				}
				resp.payload = json.encode(investment)
			}
			else {}
		}
		resp_chan <- resp
	}
}
