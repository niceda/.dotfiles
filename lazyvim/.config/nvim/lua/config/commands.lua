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
    elseif &filetype == 'sh'
      :!time bash %
    elseif &filetype == 'python'
      set splitbelow
      :sp
      :term python3 %
    elseif &filetype == 'go'
      set splitbelow
      :sp
      :term go run .
    elseif &filetype == 'markdown'
      exec "MarkdownPreview"
    endif
    endfunction
  ]])

vim.cmd([[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]])
