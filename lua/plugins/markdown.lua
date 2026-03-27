return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        preset = "modern",
        delay = 400, -- ms before popup appears
      })

      -- Register key group labels so the popup is organised
      wk.add({
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>h", group = "hunks" },
        { "<leader>t", group = "terminal" },
        { "<leader>l", group = "lsp" },
        { "<leader>e", desc = "Toggle file tree" },
      })
    end,
  },
}
