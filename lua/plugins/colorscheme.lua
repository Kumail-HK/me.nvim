return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- load before all other plugins
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        integrations = {
          telescope = true,
          neotree = true,
          gitsigns = true,
          which_key = true,
          mason = true,
          blink_cmp = true,
          render_markdown = true,
        },
      }

      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
