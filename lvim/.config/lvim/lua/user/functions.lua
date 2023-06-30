vim.cmd([[
  func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
      exec "!g++ % -o %<"
      :vsp
      :term ./%<
      :wincmd h
      :!rm -f ./%<
      :wincmd l
    elseif &filetype == 'cpp'
      exec "!clang++ -std=c++17 % -Wall -o %<"
      :vsp
      :term ./%<
      :wincmd h
      :!rm -f ./%<
      :wincmd l
    elseif &filetype == 'r'
      :vsp
      :term Rscript %
    elseif &filetype == 'java'
      set splitbelow
      :sp
      :res -5
      term javac % && time java %<
    elseif &filetype == 'sh'
      :!time bash %
    elseif &filetype == 'python'
      set splitbelow
      :vsp
      :term python3 %
    elseif &filetype == 'html'
      silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'markdown'
      exec "MarkdownPreview"
    elseif &filetype == 'tex'
      silent! exec "TexCompile"
      silent! exec "TexView"
    elseif &filetype == 'dart'
      exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
      silent! exec "CocCommand flutter.dev.openDevLog"
    elseif &filetype == 'javascript'
      set splitbelow
      :sp
      :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
      set splitbelow
      :sp
      :term go run .
    endif
    endfunction
  ]])

local M = {}

function M.smart_quit()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
  if modified then
    vim.ui.input({
      prompt = "You have unsaved changes. Quit anyway? (y/n) ",
    }, function(input)
      if input == "y" then
        vim.cmd "qa!"
      end
    end)
  else
    vim.cmd "qa!"
  end
end

return M
