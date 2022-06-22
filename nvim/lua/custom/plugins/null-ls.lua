local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
  -- Rescript
  b.formatting.rescript,

  -- Javascript / All
  b.formatting.prettierd,
  b.formatting.eslint_d,
  b.code_actions.eslint_d,
  b.diagnostics.tsc,
  b.diagnostics.eslint_d,

  -- Ruby
  b.formatting.rubocop.with { extra_args = { "-A", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" }},
  b.diagnostics.rubocop,

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },
}

local M = {}

M.setup = function()
  null_ls.setup {
    debug = true,
    sources = sources,
    -- format on save
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
      end
    end
  }
end

return M
