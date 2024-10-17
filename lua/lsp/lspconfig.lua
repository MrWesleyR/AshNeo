local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
		'intelephense',
		'jsonls',
		'sqlls',
		'html',
		'cssls',
		'ts_ls',
		'tailwindcss',
		'lua_ls'
	},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
			virtual_text=false
    end,
  },
})

local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
     -- require('nvim_lsp').lsp_expand(args.body)
    end,
  },
  window = {
		--completion = cmp.config.window.bordered(),
		--documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
		['<Tab>'] = cmp.mapping.select_next_item(),
    ['<Esc>'] = cmp.mapping.abort(),
    ['<Enter>'] = cmp.mapping.confirm({ select = true }),
	}),

  sources = cmp.config.sources({
		{ name = 'nvim_lsp_signature_help', group_index=1},
		{ name = 'nvim_lsp' , group_index = 1},
  },
	{
		{ name = 'buffer' },
	}
	),
  formatting = {
    fields = { "kind", "abbr" },
    format = function(_, vim_item)
      vim_item.kind = cmp_kinds[vim_item.kind] or ""
      return vim_item
    end,
  },
})
cmp.setup.filetype({ 'markdown', 'help' }, {
	window = {
		documentation = cmp.config.disable
	}
})

--lsp_zero.new_client({
--  name = 'my-new-lsp',
--  cmd = {'command-that-start-the-lsp'},
--  filetypes = {'my-filetype'},
--  root_dir = function()
--    return lsp_zero.dir.find_first({'some-config-file'})
--  end
--})

lsp_zero.set_sign_icons({
  error = ' ✘',
  warn = ' ⚠️',
  hint = ' ♼',
  info = ' ⚡'
})

vim.diagnostic.config({
	--signs = false,
  virtual_text = false,
  severity_sort = true,
  float = {
    style = 'minimal',
    border = 'none',
    source = 'always',
    header = '',
    prefix = '',
  },
})

vim.o.updatetime = 500
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Style vim-cmp
-- gray
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
-- blue
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
-- light blue
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
-- pink
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
-- front
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })
