lvim.builtin.treesitter.rainbow = {
	enable = true,
	query = {
		"rainbow-parens",
	},
	strategy = require("ts-rainbow").strategy.global,
	-- hlgroups = {
	-- 	-- "TSRainbowRed",
	-- 	"TSRainbowBlue",
	-- 	-- "TSRainbowOrange",
	-- 	-- "TSRainbowCoral",
	-- 	-- "TSRainbowPink",
	-- 	"TSRainbowYellow",
	-- 	-- "TSRainbowViolet",
	-- 	"TSRainbowGreen",
	-- },
}

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

lvim.builtin.telescope.defaults.file_ignore_patterns = {
	"doc",
	"%-build-%/",
	"%.in",
	".git/",
	"target/",
	"docs/",
	"vendor/*",
	"%.lock",
	"__pycache__/*",
	"%.sqlite3",
	"%.ipynb",
	"node_modules/*",
	-- "%.jpg",
	-- "%.jpeg",
	-- "%.png",
	"%.svg",
	"%.otf",
	"%.ttf",
	"%.webp",
	".dart_tool/",
	".github/",
	".gradle/",
	".idea/",
	".settings/",
	".vscode/",
	"__pycache__/",
	"build/",
	"env/",
	"gradle/",
	"node_modules/",
	"%.pdb",
	"%.dll",
	"%.class",
	"%.exe",
	"%.cache",
	"%.ico",
	"%.pdf",
	"%.dylib",
	"%.jar",
	"%.docx",
	"%.met",
	"smalljre_*/*",
	".vale/",
	"%.burp",
	"%.mp4",
	"%.mkv",
	"%.rar",
	"%.zip",
	"%.7z",
	"%.tar",
	"%.bz2",
	"%.epub",
	"%.flac",
	"%.tar.gz",
}
lvim.builtin.telescope.pickers.buffers = {
	-- previewer = false,
	initial_mode = "insert",
}

local options = {
  smartindent = true, -- make indenting smarter again
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
