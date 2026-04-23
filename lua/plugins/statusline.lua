return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local function truncate_branch(branch)
        if not branch or #branch <= 20 then return branch end

        return branch:sub(1, 20) .. '...'
      end

      require('lualine').setup {
        options = {
          theme = 'catppuccin-nvim',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            {
              'branch',
              fmt = truncate_branch,
            },
          },
          lualine_c = { 'filename' },
          lualine_x = {
            {
              'filetype',
              icon_only = false,
            },
          },
          lualine_y = {},
          lualine_z = { 'location' },
        },
      }
    end,
  },
}
