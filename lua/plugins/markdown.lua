return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    ft = { 'markdown' }, -- only loads when opening a .md file
    config = function()
      require('render-markdown').setup {
        heading = {
          -- Distinct background highlight per heading level
          backgrounds = {
            'RenderMarkdownH1Bg',
            'RenderMarkdownH2Bg',
            'RenderMarkdownH3Bg',
          },
          icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        },
        code = {
          enabled = true,
          style = 'full', -- renders code blocks with a background
          border = 'thin',
        },
        bullet = {
          enabled = true,
          icons = { '●', '○', '◆', '◇' },
        },
        checkbox = {
          enabled = true,
          unchecked = { icon = '󰄱 ' },
          checked = { icon = '󰱒 ' },
        },
      }

      -- Toggle rendering on/off with <leader>mp
      vim.keymap.set('n', '<leader>mp', '<cmd>RenderMarkdown toggle<cr>', { desc = 'Toggle markdown preview' })
    end,
  },
}

