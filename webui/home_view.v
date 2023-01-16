module webui

import freeflowuniverse.spiderlib.uikit.pages
import freeflowuniverse.spiderlib.uikit.elements
import freeflowuniverse.spiderlib.htmx
import vweb

pub fn (mut ui WebUI) home() vweb.Result {
	home_page := pages.Home{
		title: 'Threefold Ventures'
		description: 'Invest in planet first people first ventures around the globe. The Threefold Ventures platform allows you to find and participate in the governance of ventures, and to manage and track your portfolio.'
		background: './image'
		hero_button: elements.RoundedButton{
			label: 'Learn more'
			hx: htmx.navigate('/login')
		}
		// content: partials.Pool {
		// 	filterbar: partials.Filterbar {}
		// 	cards: []partials
		// }
	}

	return ui.html(home_page.html())
}
