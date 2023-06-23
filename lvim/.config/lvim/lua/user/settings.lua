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
