module webui

import freeflowuniverse.spiderlib.api { FunctionCall, FunctionResponse }
import freeflowuniverse.spiderlib.uikit.elements
import freeflowuniverse.spiderlib.uikit.partials
import freeflowuniverse.spiderlib.uikit.shell
import freeflowuniverse.spiderlib.htmx
import os
import vweb

pub struct WebUI {
	vweb.Context
	user_id   string
	call_chan chan FunctionCall
	resp_chan chan FunctionResponse
}

pub fn run(call_chan chan FunctionCall, resp_chan chan FunctionResponse) {
	mut webui := WebUI{
		call_chan: call_chan
		resp_chan: resp_chan
	}
	webui.mount_static_folder_at(os.resource_abs_path('webui/static'), '/static')
	vweb.run(webui, 8080)
}

pub fn (mut ui WebUI) before_request() {
	// redirects to requests to index
	println(ui.req)
	hx_request := ui.get_header('Hx-Request') == 'true'
	referer := ui.get_header('Referer')
	if !hx_request && ui.req.url != '/' && referer != 'http://localhost:8080/' {
		ui.redirect('')
	}
}

// index is the home page of the website
pub fn (mut ui WebUI) index() vweb.Result {
	navbar := partials.NavbarApplication{
		menu: [
			elements.Button{ // Dashboard button
				label: 'About'
				hx: htmx.navigate('/about') // nav to dashboard
			},
			elements.Button{ // Dashboard button
				label: 'Ventures'
				hx: htmx.navigate('/ventures') // nav to dashboard
			},
		]
	}

	sidebar := partials.SidebarApplication{
		// display: ui.user_id != '' // display only if user logged in
		menu: [
			elements.ButtonIcon{ // Dashboard button
				label: 'Home'
				hx: htmx.navigate('/home') // nav to dashboard
				icon: 'assets/icons/'
			},
			elements.ButtonIcon{ // Dashboard button
				label: 'Feed'
				hx: htmx.navigate('/feed') // nav to dashboard
				icon: 'assets/icons/'
			},
			elements.ButtonIcon{ // Dashboard button
				label: 'Dashboard'
				hx: htmx.navigate('/dashboard') // nav to dashboard
				icon: 'assets/icons/'
			},
			elements.ButtonIcon{ // Dashboard button
				label: 'Ventures'
				hx: htmx.navigate('/ventures') // nav to dashboard
				icon: 'assets/icons/'
			},
			elements.ButtonIcon{ // Dashboard button
				label: 'Portfolio'
				hx: htmx.navigate('/portfolio') // nav to dashboard
				icon: 'assets/icons/'
			},
		]
	}

	// route of page rendered in shell, defaults to home
	mut page := ui.req.url
	if ui.req.url == '/' {
		page = 'home'
	}

	app_shell := shell.AppShell{
		navbar: navbar
		sidebar: sidebar
		page: page
	}

	return ui.html(app_shell.html())
}
