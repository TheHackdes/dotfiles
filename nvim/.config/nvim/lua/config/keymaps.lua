-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "ycc", function()
  return "yy" .. vim.v.count1 .. "gcc']p"
end, { remap = true, expr = true })

require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<C-y>", -- Ctrl+y pour accepter la suggestion
      next = "<M-]>", -- Alt + ] pour suggestion suivante (optionnel)
      prev = "<M-[>", -- Alt + [ pour suggestion précédente (optionnel)
      dismiss = "<C-e>", -- Ctrl+e pour annuler (optionnel)
    },
  },
})
