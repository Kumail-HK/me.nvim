return {
  -- Mason: installs LSP servers, linters, formatters
  {
    'williamboman/mason.nvim',
    config = function() require('mason').setup() end,
  },

  -- Mason-lspconfig: ensures servers are installed
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls', 'ts_ls', 'pyright', 'bashls' },
        automatic_installation = true,
      }
    end,
  },

  -- nvim-lspconfig: only needed for server-specific settings
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'saghen/blink.cmp',
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Native 0.11 API: configure each server
      local servers = { 'lua_ls', 'ts_ls', 'pyright', 'bashls' }
      for _, server in ipairs(servers) do
        vim.lsp.config(server, { capabilities = capabilities })
        vim.lsp.enable(server)
      end

      -- Keymaps when LSP attaches to a buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local map = function(keys, func, desc) vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc }) end
          map('gd', vim.lsp.buf.definition, 'Go to definition')
          map('gr', vim.lsp.buf.references, 'Find references')
          map('K', vim.lsp.buf.hover, 'Hover docs')
          map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
          map('<leader>rn', vim.lsp.buf.rename, 'Rename')
        end,
      })
    end,
  },

  -- Autocompletion
  {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    opts = {
      snippets = { preset = 'default' },
      keymap = {
        preset = 'none',
        ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<CR>'] = { 'select_and_accept', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        list = { selection = { preselect = false, auto_insert = false } },
      },
      sources = {
        default = { 'lsp' },
        providers = {
          lsp = { fallbacks = {} },
        },
      },
      fuzzy = {
        implementation = 'prefer_rust_with_warning',
      },
    },
  },

  -- Linting
  {
    'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' },
        python = { 'ruff' },
        lua = { 'luacheck' },
      }
      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost' }, {
        callback = function() require('lint').try_lint() end,
      })
    end,
  },
}
