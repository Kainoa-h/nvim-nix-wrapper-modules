return {
	{
		"nvim-lspconfig",
		auto_enable = true,
		-- NOTE: define a function for lsp,
		-- and it will run for all specs with type(plugin.lsp) == table
		-- when their filetype trigger loads them
		lsp = function(plugin)
			vim.lsp.config(plugin.name, plugin.lsp or {})
			vim.lsp.enable(plugin.name)
		end,
		-- set up our on_attach function once before the spec loads
		before = function(_)
			vim.lsp.config("*", {
				on_attach = function(_, bufnr)
					-- we create a function that lets us more easily define mappings specific
					-- for LSP related items. It sets the mode, buffer and description for us each time.
					local nmap = function(keys, func, desc)
						if desc then
							desc = "LSP: " .. desc
						end
						vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
					end

					nmap("<leader>cr", vim.lsp.buf.rename, "Rename")
					nmap("<leader>ca", vim.lsp.buf.code_action, "Code A]ction")
					nmap("<leader>cgd", vim.lsp.buf.definition, "Goto Definition")
					nmap("<leader>cd", vim.lsp.buf.type_definition, "Type Definition")
					nmap("<leader>cgr", function() Snacks.picker.lsp_references() end, "Goto References")
					nmap("<leader>cgI", function() Snacks.picker.lsp_implementations() end, "Goto Implementation")
					nmap("<leader>cs", function() Snacks.picker.lsp_symbols() end, "Document Symbols")
					nmap("<leader>cw", function() Snacks.picker.lsp_workspace_symbols() end, "Workspace Symbols")

					-- See `:help K` for why this keymap
					nmap("K", vim.lsp.buf.hover, "Hover Documentation")
					nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

					-- Lesser used LSP functionality
					nmap("<leader>cgD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
					nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
					nmap("<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, "[W]orkspace [L]ist Folders")

					-- Create a command `:Format` local to the LSP buffer
					vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
						vim.lsp.buf.format()
					end, { desc = "Format current buffer with LSP" })

					nmap("<leader>cf", "<cmd>Format<cr>", "Format buffer with LSP")
				end,
			})
		end,
	},
}
