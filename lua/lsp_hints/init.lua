local M = {
  config = nil,
  enable = nil,
  disable = nil,
  set = nil,
  unset = nil,
  cache = nil,
}

function M.setup(opts)
  local config = require("lsp_hints.config")
  M.config = config

  local inlay = require("lsp_hints.inlay_hints")
  local hints = inlay.new()

  M.enable = function()
    inlay.enable(hints)
  end

  M.disable = function()
    inlay.disable(hints)
  end

  M.set = function()
    inlay.set(hints)
  end

  M.unset = function()
    inlay.unset()
  end

  M.cache = function()
    inlay.cache_render(hints)
  end

  M.render = function()
    inlay.render(hints)
  end

  config.setup(opts)
end

return M
