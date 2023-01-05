module webui

import freeflowuniverse.spiderlib.api {FunctionCall, FunctionResponse}
import freeflowuniverse.spiderlib.uikit.partials
import freeflowuniverse.spiderlib.uikit.shell
import vweb

pub struct WebUI {
	vweb.Context
	call_chan chan FunctionCall
	resp_chan chan FunctionResponse
}

pub fn run(call_chan chan FunctionCall, resp_chan chan FunctionResponse) {
	webui := WebUI{
		call_chan: call_chan
		resp_chan: resp_chan
	}
	vweb.run(webui, 8080)
}

// index is the home page of the website
pub fn (mut ui WebUI) index() vweb.Result {

	navbar := partials.DashboardNavbar {
		
	}

	sidebar := partials.DashboardSidebar {
		
	}

	app_shell := shell.AppShell {
		navbar: navbar
		sidebar: sidebar
	}

	return ui.html(app_shell.html())
}