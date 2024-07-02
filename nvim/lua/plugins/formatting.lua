return {
  {
    "stevearc/conform.nvim",
    opts = function()
      local opts = {
        log_level = vim.log.levels.DEBUG,
        formatters_by_ft = {
          json = { "jq" },
        },
      }
      return opts
    end,
  },
}
