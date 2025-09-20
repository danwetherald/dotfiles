-- Load shims first to avoid deprecation noise
pcall(require, "config.shims")
require("config.vim-options")
require("config.lazy")
