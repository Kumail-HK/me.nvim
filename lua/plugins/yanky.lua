return {
  {
    "gbprod/yanky.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts = {},
    config = function(_, opts)
      require("yanky").setup(opts)
      require("telescope").load_extension("yank_history")

      vim.keymap.set({ "n", "x" }, "<leader>fy", function()
        require("telescope").extensions.yank_history.yank_history()
      end, { desc = "Yank history" })
    end,
  },
}
