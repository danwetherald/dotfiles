local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
  -- Javascript
  b.formatting.eslint,
  b.formatting.rescript,
  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css", "javascript" } },
  b.formatting.deno_fmt,

  b.code_actions.eslint_d,
  b.diagnostics.tsc,

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
