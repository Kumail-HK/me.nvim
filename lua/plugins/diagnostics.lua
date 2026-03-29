return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        modes = {
          diagnostics = {
            mode = "diagnostics",
            filter = { buf = 0 }, -- current file only
            auto_open = false,
            auto_close = true,   -- closes automatically when no more issues
          },
        },
      })

      vim.keymap.set("n", "<leader>q", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        { desc = "File diagnostics" })
    end,
  },
}
