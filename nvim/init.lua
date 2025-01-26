-- Map leader to comma. This lets me do a lot of shortcuts using both hands
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("config.lazy")
require("options")
require("keymaps")
