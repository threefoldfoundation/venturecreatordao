module webui

import vweb
import freeflowuniverse.spiderlib.uikit.pages
import freeflowuniverse.spiderlib.uikit.elements
import freeflowuniverse.spiderlib.uikit.partials
import freeflowuniverse.spiderlib.html

pub fn (mut ui WebUI) dashboard() vweb.Result {
	home_page := pages.Dashboard{
		// cards: [
		// 	partials.DashboardCard{
		// 		heading: html.h1{
		// 			hx: htmx.get('${user}//.portfolio.value()}')
		// 		}
		// 		description: 'Total portfolio value'
		// 		button: Button{
		// 			label: 'View Portfolio'
		// 			hx: htmx.navigate('portfolio')
		// 		}
		// 	},
		// 	partials.DashboardCard{
		// 		heading: html.h1{
		// 			hx: htmx.get('${user}//.portfolio.value()}')
		// 		}
		// 		description: 'Total portfolio value'
		// 		button: Button{
		// 			label: 'View Portfolio'
		// 			hx: htmx.navigate('portfolio')
		// 		}
		// 	},
		// 	partials.DashboardCard{
		// 		heading: html.h1{
		// 			hx: htmx.get('${user}//.portfolio.value()}')
		// 		}
		// 		description: 'Total portfolio value'
		// 		button: Button{
		// 			label: 'View Portfolio'
		// 			hx: htmx.navigate('portfolio')
		// 		}
		// 	},
		// ]
		// title: 'Threefold Ventures'
		// description: 'Threefold Ventures'
		// background: './image'
		// // hero_button: uikit.elements.Button {
		// // 	label: 'Get started'
		// // 	hx: htmx.navigate('/login')
		// // }
	}

	return ui.html(home_page.html())
}
