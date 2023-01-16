module webui

import vweb

pub fn (mut ui WebUI) profile() vweb.Result {
	return ui.html('ok')
}
