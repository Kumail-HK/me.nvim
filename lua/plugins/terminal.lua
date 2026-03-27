return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then return 15
          elseif term.direction == "vertical" then return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<c-\>]],   -- Ctrl+\ to toggle
        direction = "float",         -- float | horizontal | vertical
        float_opts = {
          border = "curved",
        },
        shade_terminals = false,
      })

      -- Lazygit inside terminal
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
      vim.keymap.set("n", "<leader>gl", function() lazygit:toggle() end, { desc = "Lazygit" })

      -- Horizontal split terminal
      vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Horizontal terminal" })
      -- Vertical split terminal
      vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Vertical terminal" })
    end,
  },
}
