module webui

import freeflowuniverse.spiderlib.uikit.pages
import freeflowuniverse.spiderlib.htmx
import vweb

pub fn (mut ui WebUI) home() vweb.Result {

	home_page := pages.Home {
		title: 'Threefold Ventures'
		description: 'Threefold Ventures'
		background: './image'
		// hero_button: uikit.elements.Button {
		// 	label: 'Get started'
		// 	hx: htmx.navigate('/login')
		// }
	}

	return ui.html(home_page.html())
}