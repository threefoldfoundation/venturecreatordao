module webui

import vweb
import freeflowuniverse.spiderlib.uikit.pages
import freeflowuniverse.spiderlib.uikit.elements
import freeflowuniverse.spiderlib.uikit.partials
import freeflowuniverse.spiderlib.uikit.flowbite
import freeflowuniverse.spiderlib.html
import freeflowuniverse.spiderlib.htmx

pub fn (mut ui WebUI) dashboard() vweb.Result {
	portfolio := ui.user.get_portfolio()
	// ventures := ui.user.get_ventures()

	portfolio_card := flowbite.DashboardCard{
		htmx: htmx.navigate('/portfolio')
		heading: ui.user.portfolio.get_value().str()
		description: 'Total portfolio value'
		delta: ui.user.portfolio.get_delta()
		button: html.Button{
			content: 'View Portfolio'
			htmx: htmx.navigate('/portfolio')
		}
	}

	lp_card := flowbite.DashboardCard{
		htmx: htmx.navigate('/liquidity-pool')
		heading: ui.user.portfolio.get_value().str()
		description: 'Current Gold Tokens'
		button: html.Button{
			content: 'Liquidity Pool'
			htmx: htmx.navigate('/liquidity-pool')
		}
	}

	calender_card := flowbite.DashboardCard{
		htmx: htmx.navigate('/calender')
		heading: ui.user.portfolio.get_value().str()
		description: 'Upcoming event'
		button: html.Button{
			content: 'View Calender'
			htmx: htmx.navigate('/calender')
		}
	}

	activity_card := flowbite.DashboardCard{
		htmx: htmx.navigate('/feed')
		heading: 'Latest Activities'
		button: html.Button{
			content: 'View Feed'
			htmx: htmx.navigate('/feed')
		}
		content: flowbite.CardList {
			ui.dao.get_activities().map(
				flowbite.ListItem{
					heading: 'OurParadise'
					time: it.created_at.format()
					tag: 'Funding'
					content: 'OurParadise received \$35000 in funding.'
				}
			)
		}
	}

	venture_card := flowbite.DashboardCard{
		htmx: htmx.navigate('/ventures')
		heading: 'Ventures'
		button: html.Button{
			content: 'View Ventures'
			htmx: htmx.navigate('/ventures')
		}
		content: flowbite.Table {
			headers: ['Venture', 'Stake', '']
			rows: portfolio.ventures.map(
				[
					it.venture.title,
					it.amount.str(),
					(it.amount / portfolio.value).str()
				]
			)
		}
	}


	home_page := flowbite.Dashboard{
		rows: [
			[portfolio_card, lp_card, calender_card],
			[activity_card, venture_card]
		]
		// list_card: flowbite.DashboardCard {
		// 	htmx: htmx.navigate('/calender')
		// 	heading: 'Latest Activity'
		// 	button: html.Button {
		// 		content: 'View Feed'
		// 		htmx: htmx.navigate('/feed')
		// 	}
		// }
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
