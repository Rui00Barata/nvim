vim.api.nvim_set_var("vimtex_view_method", 'skim')
vim.api.nvim_set_var("vimtex_view_general_viewer", 'skim')
vim.api.nvim_set_var("vimtex_context_pdf_viewer", 'skim')
vim.bo.shiftwidth = 0
vim.bo.tabstop = 2
vim.bo.softtabstop = 2

vim.g.Tex_IgnoredWarnings =
    'Underfull\n'..
    'Overfull\n'..
    'specifier changed to\n'..
    'You have requested\n'..
    'Missing number, treated as zero.\n'..
    'There were undefined references\n'..
    'Citation %.%# undefined\n'

vim.g.Tex_IgnoreLevel = 7
