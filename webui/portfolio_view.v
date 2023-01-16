module webui

import vweb
import freeflowuniverse.spiderlib.uikit.pages

pub fn (mut ui WebUI) portfolio() vweb.Result {
	page := pages.Portfolio{
		// title: 'Threefold Ventures'
		// description: 'Threefold Ventures'
		// background: './image'
		// // hero_button: uikit.elements.Button {
		// // 	label: 'Get started'
		// // 	hx: htmx.navigate('/login')
		// // }
	}

	return ui.html(page.html())
}
