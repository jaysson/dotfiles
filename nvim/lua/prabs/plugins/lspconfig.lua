-- Setup Mason to automatically install LSP servers
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local default_setup = function(server)
	require("lspconfig")[server].setup({
		capabilities = lsp_capabilities,
	})
end

require("mason").setup()
require("mason-lspconfig").setup({
	automatic_installation = true,
	ensure_installed = {},
	handlers = {
		default_setup,
		jsonls = function()
			require("lspconfig").jsonls.setup({
				capabilities = capabilities,
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
					},
				},
			})
		end,
	},
})

require("neodev").setup()

-- Keymaps
vim.keymap.set("n", "<Leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "<Leader>/", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")

-- Diagnostic configuration
vim.diagnostic.config({
	virtual_text = false,
	float = {
		source = true,
	},
})
