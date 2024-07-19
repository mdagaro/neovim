
require('mini.comment').setup()
-- Simple and easy statusline.
--  You could remove this setup call if you don't like it,
--  and try some other statusline plugin
local statusline = require 'mini.statusline'
statusline.setup()

-- You can configure sections in the statusline by overriding their
-- default behavior. For example, here we set the section for
-- cursor location to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
return '%2l:%-2v'
end

-- ... and there is more!
--  Check out: https://github.com/echasnovski/mini.nvim
