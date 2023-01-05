module webui

import vweb

pub fn (mut ui WebUI)venture() vweb.Result {
	return ui.html('ok')
}

pub fn (mut ui WebUI)venture_card() vweb.Result {
	return ui.html('ok')
}
