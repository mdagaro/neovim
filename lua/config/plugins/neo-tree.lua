local ntree = require('neo-tree')
local command = require("neo-tree.command")

ntree.setup({
	window = {
		position = "right",
		mappings = {
			["u"] = "navigate_up",
			["C"] = "set_root",
		}
	},
	event_handlers = {
		{
			event = "file_opened",
			handler = function()
				require("neo-tree.command").execute({ action = "close" })
			end
		},
	}
})

vim.keymap.set('n', '<leader>nn', function()
	command.execute({ toggle = true })
end
)

vim.keymap.set('n', '<leader>nf', function()
	local reveal_file = vim.fn.expand('%:p')
	if (reveal_file == '') then
		reveal_file = vim.fn.getcwd()
	else
		local f = io.open(reveal_file, "r")
		if (f) then
			f.close(f)
		else
			reveal_file = vim.fn.getcwd()
		end
	end
	command.execute({ reveal_file = reveal_file })
end
)
