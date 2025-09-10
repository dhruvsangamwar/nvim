local lsp_zero = require('lsp-zero')
local cmp = require('cmp')

lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

cmp.setup({
  -- There may be other settings in your setup too,  
  -- but below is what offers the custom mapping
   mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({select = true}),
  }),
})

require('mason').setup()
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {'rust_analyzer'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    lsp_zero.default_setup,
  },
})
