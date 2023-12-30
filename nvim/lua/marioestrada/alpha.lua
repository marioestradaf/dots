local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

math.randomseed(os.time())
local function pick_color()
  local colors = {"String", "Identifier", "Keyword", "Number"}
  return colors[math.random(#colors)]
end

function read(cmd)
  local handle = io.popen(cmd)
  local result = handle:read("*a")
  handle:close()
  return result
end

local system = read('uname -s | tr -d "\n"')
local host = read('uname -n | tr -d "\n"')
local machine = read('uname -m | tr -d "\n"')
local datetime = os.date("%b. %d %Y // %H:%M:%S")
local username = os.getenv("USER") or os.getenv("USERNAME")

local function getGreeting(name)
  local tableTime = os.date("*t")
  local hour = tableTime.hour
  local greetingsTable = {
    [1] = "  Sleep well",
    [2] = "  Good morning",
    [3] = "  Good afternoon",
    [4] = "  Good evening",
    [5] = "󰖔  Good night",
  }
  local greetingIndex = 0
  if hour == 23 or hour < 7 then
    greetingIndex = 1
  elseif hour < 12 then
    greetingIndex = 2
  elseif hour >= 12 and hour < 18 then
    greetingIndex = 3
  elseif hour >= 18 and hour < 21 then
    greetingIndex = 4
  elseif hour >= 21 then
    greetingIndex = 5
  end
  return "".. greetingsTable[greetingIndex] .. ", " .. name:upper()
end

local greeting = getGreeting(username)

local logo = {
  "+                                                                      +",
  "                                                                        ",
  "   ░░░░░░░░░░░░  "..system:upper().." DATA SYSTEMS             "..machine:upper().." ///////////////",
  "   ░░▒██████▒░░                                                          ",
  "   ░░░▒████▒░░░  "..host.."                                              ",
  "   ░░░░▒██▒░░░░  ONLINE                                                  ",
  "   ░░░░░░░░░░░░                                                          ",
  "                                                                         ",
  "   "..datetime.." ",
  "   ────────────────────────────────────────────────────────────────────  ",
  "   "..greeting.." ",
  "   ────────────────────────────────────────────────────────────────────  ",
  "+                                                                       +",
}

dashboard.section.header.val = logo
dashboard.section.header.opts.hl = pick_color()

dashboard.section.buttons.val = {
  dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
  dashboard.button( "n", "  > Open Editor", ":NvimTreeOpen <CR>"),
  dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
  dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
  dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
  dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
  autocmd FileType alpha setlocal nofoldenable
]])
