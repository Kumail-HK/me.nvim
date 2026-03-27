return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          position = "left",
          width = 35,
        },
        filesystem = {
          follow_current_file = { enabled = true },
          hide_dotfiles = false,
        },
      })

      vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })
      vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus file tree" })
    end,
  },
}
