-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

if vim.g.neovide then
  vim.o.guifont='Maple Mono NF CN:h11'
  vim.g.neovide_title_background_color = string.format(
    "%x",
    vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg
  )
  vim.g.neovide_title_text_color = "pink"
  vim.g.neovide_floating_shadow = false
  vim.g.experimental_layer_grouping = true

  vim.g.neovide_detach_on_quit = 'always_detach'
  vim.g.neovide_position_animation_length = 0.15
  vim.g.neovide_cursor_animate_command_line = false
end
