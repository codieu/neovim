vim.opt.laststatus=3
vim.opt.statusline='%!v:lua.statusline()'

vim.opt.statuscolumn='%C%s%r'

-- following is based on blogpost `https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html`
winbar = {}

local modes = {
  ["n"]  = "NORMAL",
  ["no"] = "OP NORM",
  ["nt"] = "TERM NORM",

  ["i"]  = "INSERT",
  ["ic"] = "INSERT",

  ["R"]  = "REPLACE",

  ["v"]  = "VISUAL",
  ["V"]  = "VIS LINE",
  [""] = "VIS BLOCK",
  ["Rv"] = "VIS REPLACE",

  ["s"]  = "SELECT",
  ["S"]  = "SEL LINE",
  [""] = "SEL BLOCK",

  ["c"]  = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",

  ["r"]  = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",

  ["!"]  = "SHELL",
  ["t"]  = "TERMINAL",
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s", modes[current_mode]):upper()
end

local function file()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.")
  if fpath == "" or fpath == "." then
      return " "
  end

  return string.format(" %%<%s", fpath)
end

local function dirty()
  return "%m"
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#DiagnosticVirtualTextError# " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#DiagnosticVirtualTextWarn# " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#DiagnosticVirtualTextHint# " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#DiagnosticVirtualTextInfo# " .. count["info"]
  end

  return errors .. warnings .. hints .. info
end

local function filetype()
  return string.format(" %s ", vim.bo.filetype):upper()
end

local function lineinfo()
  return " %P %l:%c   "
end

winbar.active = function()
  return table.concat {
    "%#StatusLine#",
    dirty(),
    file(),
    lsp(),
    "%#StatusLine# %{get(b:,'gitsigns_status','')}",
    " %#WinSeparator#│%#Normal#%=%#WinSeparator#│%#StatusLine#",
    filetype()
  }
end

-- xxx: fix nvimtree things
function winbar.inactive()
  return "%#StatusLineNC#%m %t %#WinSeparator#│%#Normal# %=%#WinSeparator#│%#StatusLine# :3"
end

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au BufEnter * if winheight(0) > 1 | setl winbar=%!v:lua.winbar.active() | endif
  au BufLeave * if winheight(0) > 1 | setl winbar=%!v:lua.winbar.inactive() | endif
  augroup END
]], false)

function statusline()
  return table.concat {
    "%#StatusLine#",
    mode(),
    file(),
    "%{get(b:,'gitsigns_status','')}",
    lineinfo(),
  }
end

-- TODO: come back to this some time
-- TBH native one is good enough
-- vim.opt.tabline='%!v:lua.tabline()'
--
-- function tabline()
--   local tablist = ""
--   for tab=1, vim.fn.tabpagenr('#'),1 do
--     local hl
--     if tab == vim.fn.tabpagenr() then
--       hl = "%#TabLineSel#"
--     else
--       hl = "%#TabLine#"
--     end
--     local tabWinNum  = vim.fn.tabpagewinnr(tab)
--     local tabBufId   = vim.fn.tabpagebuflist(tab)[tabWinNum]
--     local tabWinPath = vim.api.nvim_buf_get_name(tabBufId)
--     local tabWinFile = vim.fn.fnamemodify(tabWinPath, ":t")
--     tablist = tablist .. hl .. " " .. tabBufId .. " " .. tabWinFile
--   end
--   local background = vim.o.background
--   -- TODO: make this cool
--   tablist = tablist .. "%#Normal# %=%#WinSeparator#│%#TabLine# " .. background
--   return tablist
-- end
