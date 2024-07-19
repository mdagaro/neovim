local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		-- Conform will run multiple formatters sequentially
		python = { "black" },
	},
	format_after_save = {
		lsp_fallback = true,
	},
	formatters = {
		black = {
			prepend_args = { "--line-length", "80" },
		},
		prettier = {
			command = function(self, bufnr)
				local util = require("config.util")
				local fs = require("conform.fs")
				local cmd = util.find_executable({ ".yarn/sdks/prettier/bin-prettier.js" }, "")(self,
					bufnr)
				if cmd ~= "" then
					return cmd
				end
				-- return type of util.from_node_modules is fun(self: conform.FormatterConfig, ctx: conform.Context): string
				---@diagnostic disable-next-line
				return util.from_node_modules(fs.is_windows and "prettier.cmd" or "prettier")(self, bufnr)
			end,

		}
	}
})
