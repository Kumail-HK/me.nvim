return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<c-\>]],
        direction = 'float',
        float_opts = {
          border = 'curved',
        },
        shade_terminals = false,
      }

      local Terminal = require('toggleterm.terminal').Terminal

      -- Lazygit
      local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float' }
      vim.keymap.set('n', '<leader>hl', function() lazygit:toggle() end, { desc = 'Lazygit' })

      -- OpenCode: opens in a large vertical split so you can see your code alongside it
      local opencode = Terminal:new {
        cmd = 'opencode',
        direction = 'vertical',
        size = vim.o.columns * 0.45,
        hidden = true,
        on_open = function(term)
          vim.cmd 'startinsert!'
        end,
      }

      vim.keymap.set('n', '<leader>ac', function() opencode:toggle() end, { desc = 'OpenCode' })

      -- Horizontal split terminal
      vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'Horizontal terminal' })
      -- Vertical split terminal
      vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', { desc = 'Vertical terminal' })
    end,
  },
}
