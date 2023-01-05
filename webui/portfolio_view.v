module webui

import vweb

pub fn (mut ui WebUI)portfolio() vweb.Result {
	return ui.html('ok')
}