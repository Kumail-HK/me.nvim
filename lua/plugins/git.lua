return {
  -- Git gutter signs + hunk operations
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local map = function(mode, l, r, desc) vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc }) end

          map('n', ']h', gs.next_hunk, 'Next hunk')
          map('n', '[h', gs.prev_hunk, 'Prev hunk')
          map('n', '<leader>hs', gs.stage_hunk, 'Stage hunk')
          map('n', '<leader>hr', gs.reset_hunk, 'Reset hunk')
          map('n', '<leader>hp', gs.preview_hunk, 'Preview hunk')
          map('n', '<leader>hb', gs.blame_line, 'Blame line')
          map('n', '<leader>hd', gs.diffthis, 'Diff this')
        end,
      }
    end,
  },

  -- Full git UI (Magit-style)
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    config = function()
      require('neogit').setup {
        integrations = { diffview = true },
      }

      vim.keymap.set('n', '<leader>hg', '<cmd>Neogit<cr>', { desc = 'Open Neogit' })
      vim.keymap.set('n', '<leader>hD', '<cmd>DiffviewOpen<cr>', { desc = 'Open Diffview' })
    end,
  },
}
