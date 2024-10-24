-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.relativenumber = false -- Relative line numbers
opt.fileencodings = "utf-8,ucs-bom,gb18030,gbk,gb2312,cp936" -- File encoding

vim.g.autoformat = false

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

-- TODO: 1. 判断是否在 orbstack 容器里面 2. 同时将内容发送到tmux的剪贴板
if vim.fn.has("unix") == 1 then
  vim.g.clipboard = {
    copy = {
      ["+"] = "pbcopy",
      ["*"] = "pbcopy",
    },
    paste = {
      ["+"] = "pbpaste",
      ["*"] = "pbpaste",
    },
  }
end
