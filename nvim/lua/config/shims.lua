-- Neovim 0.10+ deprecations compatibility shims
-- Shadow deprecated APIs that some plugins still call, to avoid warnings.

-- tbl_islist → islist
do
  local islist = type(vim.islist) == "function" and vim.islist or nil
  -- Always override to bypass built-in deprecation wrapper
  vim.tbl_islist = islist or function(t)
    if type(t) ~= "table" then return false end
    local max = 0
    for k, _ in pairs(t) do
      if type(k) ~= "number" or k < 1 or k % 1 ~= 0 then
        return false
      end
      if k > max then max = k end
    end
    for i = 1, max do
      if t[i] == nil then return false end
    end
    return true
  end
end

-- Optionally, quiet a few common helpers if needed later.
-- Uncomment if you hit additional warnings.
-- do
--   if vim.tbl_isempty == nil or debug.getinfo(vim.tbl_isempty).name == "deprecate" then
--     vim.tbl_isempty = function(t)
--       return next(t) == nil
--     end
--   end
-- end

