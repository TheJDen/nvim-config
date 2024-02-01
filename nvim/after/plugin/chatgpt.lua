local function read_file(path)
    local file = io.open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

vim.env.OPENAI_API_HOST = "api.openai.com"
local home = vim.fn.expand("$HOME")
vim.env.OPENAI_API_KEY = read_file(home .. "/secret.txt")

local chatgpt = require("chatgpt")

vim.keymap.set({'n', 'v'}, '<C-e>', function()
    chatgpt.edit_with_instructions()
end)
