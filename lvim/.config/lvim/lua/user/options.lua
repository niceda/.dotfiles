lvim.log.level = "warn"
lvim.builtin.bufferline.active = false
lvim.builtin.breadcrumbs.active = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
-- lvim.builtin.treesitter.matchup.enable = true
lvim.colorscheme = "lunar"
-- lvim.colorscheme = "primer_dark"
-- lvim.colorscheme = "onedark"
-- lvim.colorscheme = "vscode"
-- lvim.colorscheme = "darkplus"

-- Set a compatible clipboard manager
if vim.fn.has("wsl") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
	vim.g.clipboard = {
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf",
		},
		paste = {
			["+"] = "win32yank.exe -o --lf",
			["*"] = "win32yank.exe -o --lf",
		},
	}
end

local options = {
	smartindent = true, -- make indenting smarter again
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
