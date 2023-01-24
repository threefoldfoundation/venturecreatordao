module main

import json
import freeflowuniverse.spiderlib.api { FunctionResponse }
import api as api2
import webui
import app

fn main() {
	// application running businness logic etc.
	// dao := VentureCreatorDAO{}
	dao := app.mock_venture_creator()

	// run web app user interface with messaging channels
	api := api2.new_api()
	spawn api2.run(api)

	// run web app user interface with messaging channels
	ui := webui.new_webui()
	spawn webui.run(ui)

	for {
		call := <-api.call_chan

		mut resp := FunctionResponse{
			thread_id: call.thread_id
			function: call.function
		}

		match call.function {
			'get_ventures' {
				ventures := dao.get_ventures()
				resp.payload = json.encode(ventures)
			}
			'get_portfolio' {
				// portfolio := dao.get_portfolio()
				// resp.payload = json.encode(portfolio)
			}
			'invest' {
				// mut user := dao.get_user(call.user_id) or {
				// 	println('Failed to decode function call payload: ${call}')
				// 	continue
				// }
				// mut venture := dao.get_venture(call.payload) or {
				// 	println('Failed to decode function call payload:')
				// 	continue
				// }
				// mut args := json.decode(InvestArgs, call.payload) or {
				// 	println('Failed to decode function call payload: ')
				// 	continue
				// }
				// investment := user.invest(mut args) or {
				// 	println('Failed to decode function call payload:')
				// 	continue
				// }
				// resp.payload = json.encode(investment)
			}
			else {}
		}
		api.resp_chan <- &resp
	}
}
