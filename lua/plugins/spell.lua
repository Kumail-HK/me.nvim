return {
  {
    'ravibrock/spellwarn.nvim',
    event = 'VeryLazy',
    config = function()
      require('spellwarn').setup {
        enable = false,
      }

      vim.keymap.set('n', '<leader>st', function()
        vim.opt_local.spell = not vim.opt_local.spell:get()
        if vim.opt_local.spell:get() then
          require('spellwarn').enable()
          vim.notify('Spell check enabled', vim.log.levels.INFO)
        else
          require('spellwarn').disable()
          vim.notify('Spell check disabled', vim.log.levels.INFO)
        end
      end, { desc = 'Toggle spell checker' })
    end,
  },
}
