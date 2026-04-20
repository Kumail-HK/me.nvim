return {
  {
    'stevearc/conform.nvim',
    config = function()
      local mason_bin = vim.fn.stdpath 'data' .. '/mason/bin/'
      require('conform').setup {
        formatters_by_ft = {
          javascript = { 'prettier' },
          typescript = { 'prettier' },
          json = { 'prettier' },
          markdown = { 'prettier' },
          python = { 'black' },
          lua = { 'stylua' },
        },
        -- optional: format automatically on save
        -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
        -- Tell conform to look in Mason's bin folder
        formatters = {
          prettier = {
            command = mason_bin .. 'prettier',
          },
          stylua = {
            command = mason_bin .. 'stylua',
          },
          black = {
            command = mason_bin .. 'black',
          },
        },
      }

      -- Overwrite <leader>lf to use conform with LSP as fallback
      vim.keymap.set('n', '<leader>lf', function()
        vim.notify('Running formatter for: ' .. vim.bo.filetype)
        require('conform').format { async = true, lsp_fallback = 'always' }
      end, { desc = 'Format file' })
    end,
  },
}
