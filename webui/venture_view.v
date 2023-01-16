module webui

import vweb
import freeflowuniverse.spiderlib.uikit.pages
import freeflowuniverse.spiderlib.uikit.partials

pub fn (mut ui WebUI) venture() vweb.Result {
	page := pages.VenturePage{
		heading: partials.Heading{}
	}
	return ui.html(page.html())
}

pub fn (mut ui WebUI) venture_card() vweb.Result {
	return ui.html('ok')
}
