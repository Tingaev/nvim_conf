local bindings = {
  '<Up>',
  '<Down>',
  '<Left>',
  '<Right>',
}

for _, binding in ipairs(bindings) do
  vim.api.nvim_set_keymap("n", binding, "<Nop>", {})
end

