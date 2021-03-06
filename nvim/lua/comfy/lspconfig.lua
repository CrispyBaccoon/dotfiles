local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
 local buf_set_keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
 local buf_set_option = function(...) vim.api.nvim_buf_set_option(bufnr, ...) end

 -- Mappings.
 local opts = { noremap = true, silent = true }

 buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
 buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
 buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
 buf_set_keymap('n', '<leader>l', ':lua vim.lsp.buf', { noremap = true })
 buf_set_keymap('n', 'gl', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
 buf_set_keymap('n', 'L', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
 buf_set_keymap('n', '<space>s', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)

 -- require 'completion'.on_attach(client, bufnr)
end

local lspservers = '/home/comfy/.local/share/nvim/lsp_servers'

nvim_lsp.tsserver.setup {
 on_attach = on_attach,
 cmd = { lspservers .. '/tsserver/node_modules/.bin/tsserver' },
 filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" }
}
nvim_lsp.cssls.setup {
 on_attach = on_attach,
 cmd = { lspservers .. '/cssls/node_modules/vscode-langservers-extracted/bin/vscode-css-language-server' }
}
nvim_lsp.sumneko_lua.setup {
 on_attach = on_attach,
 cmd = { lspservers .. '/sumneko_lua/extension/server/bin/lua-language-server' }
}
nvim_lsp.gopls.setup {
 on_attach = on_attach,
 cmd = { lspservers .. '/go/gopls' }
}
nvim_lsp.vuels.setup {
 on_attach = on_attach,
 cmd = { lspservers .. '/vuels/node_modules/vls/bin/vls' }
}
--[[ nvim_lsp.markdown.setup{
  on_attach = on_attach,
  cmd = {'/home/comfy/.local/share/nvim/lsp_servers/remark_ls/node_modules/.bin/remark-language-server'}
} ]]
--[[ nvim_lsp.vimls.setup {
 on_attach = on_attach,
 cmd = { lspservers .. '/vim/node_modules/vim-language-server/bin/index.js' },
 filetypes = { "vim" }
} ]]
nvim_lsp.perlnavigator.setup {
 on_attach = on_attach,
 cmd = { lspservers .. '/perlnavigator/node_modules/perlnavigator-server/out/server.js' },
 filetypes = { "perl" }
}
--[[ nvim_lsp.tailwindcss.setup{
  on_attach = on_attach,
  cmd = {'/home/comfy/.local/share/nvim/lsp_servers/tailwindcss_npm/node_modules/@tailwindcss/language-server/bin/tailwindcss-language-server'}
} ]]
