if vim.g.vscode then
  -- VSCode extension

  require("after.plugin.defaults").setup()
  require("after.plugin.keymaps").setup()
else
  -- ordinary Neovim

  require("statusline").setup()
  require("plugins").setup()
end
