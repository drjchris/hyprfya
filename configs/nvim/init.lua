
-- Set relative line numbers
vim.wo.relativenumber = true
vim.wo.number = true

-- Set nowrap
vim.wo.wrap = false

-- Set tabs to 4 spaces
vim.opt.tabstop = 4        -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4     -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true    -- Use spaces instead of tabs

-- Set background to transparent
vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')
vim.cmd('highlight NonText guibg=NONE ctermbg=NONE')
vim.cmd('highlight EndOfBuffer guibg=NONE ctermbg=NONE')

-- Use Wayland clipboard
vim.opt.clipboard = 'unnamedplus'

-- Enable auto-pairs
vim.cmd([[
  function! AutoClose()
    if getline('.')[col('.')-2] =~# '[({["]'
      return getline('.')[col('.')-2]
    else
      return ''
    endif
  endfunction

  inoremap ( () <Left>
  inoremap { {} <Left>
  inoremap [ [] <Left>
  inoremap " "" <Left>
  inoremap ' '' <Left>
  autocmd InsertCharPre * call AutoClose()
]])


