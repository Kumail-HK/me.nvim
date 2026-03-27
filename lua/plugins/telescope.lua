return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          sorting_strategy = "ascending",
          layout_config = { prompt_position = "top" },
        },
      })
      telescope.load_extension("fzf")

      local builtin = require("telescope.builtin")
      -- Find files
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      -- Live grep (search strings across project)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      -- Grep for word under cursor
      vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })
      -- Recent files
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
      -- Buffers
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Open buffers" })
    end,
  },
}
