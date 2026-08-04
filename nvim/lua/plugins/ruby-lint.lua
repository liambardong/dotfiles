return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      local lint = require("lint")

      -- Configure RuboCop linter
      lint.linters.rubocop = {
        name = "rubocop",
        cmd = "bundle",
        stdin = true,
        append_fname = false,
        args = {
          "exec",
          "rubocop",
          "--format",
          "json",
          "--force-exclusion",
          "--stdin",
          function()
            return vim.api.nvim_buf_get_name(0)
          end,
        },
        stream = "stdout",
        ignore_exitcode = true,
        env = nil,
        parser = function(output, bufnr)
          local diagnostics = {}
          if output == "" then
            return diagnostics
          end

          local ok, decoded = pcall(vim.json.decode, output)
          if not ok or not decoded then
            return diagnostics
          end

          local files = decoded.files or {}
          for _, file in ipairs(files) do
            for _, offense in ipairs(file.offenses or {}) do
              local severity = vim.diagnostic.severity.WARN
              if offense.severity == "error" or offense.severity == "fatal" then
                severity = vim.diagnostic.severity.ERROR
              end

              table.insert(diagnostics, {
                bufnr = bufnr,
                lnum = (offense.location.start_line or 1) - 1,
                col = (offense.location.start_column or 1) - 1,
                end_lnum = (offense.location.last_line or offense.location.start_line or 1) - 1,
                end_col = (offense.location.last_column or offense.location.start_column or 1),
                severity = severity,
                message = offense.message,
                source = "rubocop",
                code = offense.cop_name,
              })
            end
          end
          return diagnostics
        end,
      }

      -- Set up linters_by_ft
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.ruby = { "rubocop" }

      return opts
    end,
    config = function(_, opts)
      local lint = require("lint")

      -- Apply the linters_by_ft configuration
      for ft, linters in pairs(opts.linters_by_ft) do
        lint.linters_by_ft[ft] = linters
      end

      -- Auto-run linter on these events
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("lint", { clear = true }),
        callback = function()
          if vim.bo.filetype == "ruby" then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
