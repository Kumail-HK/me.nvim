return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require 'which-key'
      wk.setup {
        preset = 'modern',
        delay = 400, -- ms before popup appears
      }

      -- Register key group labels so the popup is organised
      wk.add {
        { '<leader>f', group = 'find' },
        { '<leader>h', group = 'git' },
        { '<leader>t', group = 'terminal' },
        { '<leader>l', group = 'lsp' },
        { '<leader>e', desc = 'Toggle file tree' },
        { '<leader>q', desc = 'File diagnostics' },
        { '<leader>m', group = 'markdown' },
        { '<leader>ac', group = 'ai' },
      }
    end,
  },
}
