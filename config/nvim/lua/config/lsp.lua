-- Common LSP config
vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			}
		}
	},
	root_markers = { ".git" },
})

-- Enable LSPs
vim.lsp.enable({
	"lua_ls",
	"rust_ls",
})

-- Configure diagnostic messages
vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	}
});

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local opts = { buffer = args.buf }
		if client:supports_method("textDocument/definition") then
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		end
		if client:supports_method("textDocument/declaration") then
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		end
		if client:supports_method("textDocument/references") then
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		end
		if client:supports_method("textDocument/implementation") then
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		end
		if client:supports_method("textDocument/hover") then
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		end
		if client:supports_method("textDocument/rename") then
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		end
		if client:supports_method("textDocument/formatting") then
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end
		-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
		if client:supports_method("textDocument/completion") then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			-- client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		if not client:supports_method("textDocument/willSaveWaitUntil")
				and client:supports_method("textDocument/formatting") then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = false }),
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})
