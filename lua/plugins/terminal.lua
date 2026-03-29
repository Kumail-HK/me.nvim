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

      -- Claude Code: opens in a large vertical split so you can see your code alongside it
      local claude = Terminal:new {
        cmd = 'claude',
        direction = 'vertical',
        size = vim.o.columns * 0.45,
        hidden = true,
        on_open = function(term)
          -- Switch to insert mode automatically so you can type straight away
          vim.cmd 'startinsert!'
          -- Close the terminal if claude exits cleanly
          term.on_exit = function() term:close() end
        end,
      }

      vim.keymap.set('n', '<leader>ac', function() claude:toggle() end, { desc = 'Claude Code' })

      -- Horizontal split terminal
      vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'Horizontal terminal' })
      -- Vertical split terminal
      vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', { desc = 'Vertical terminal' })
    end,
  },
}
