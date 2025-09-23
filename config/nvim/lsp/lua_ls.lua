return {
	cmd = { 'lua-language-server' },
	filetype = { 'lua' },
	root_markers = {
		'.luarc.json',
		'.luarc.jsonc',
		'luacheckrc',
		'stylua.toml',
		'.stylua.toml',
	},
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					'vim',
					'require',
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file('', true),
			},
			telemetry = {
				-- Do not send telemetry data
				enable = false,
			},
		}
	}
}
