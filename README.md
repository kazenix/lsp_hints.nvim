# lsp_hints.nvim
this is just an extraction of the rust-tools inlay hints portion, as that was the only bit of the functionality I was using. 
Now I don't have to do jank things when setting up rust_analyzer and all my keybinds work.

Also, I removed the bit that was checking that this was a rust_analyzer server, and replaced it with a check for supporting inlayHints. So hopefully this should work with any LSP server that supports the inlayHint.

Obviously this is a stopgap until nvim's built-in inlay hints hits the main releases.

## Configuration
```lua
local defaults = {
  -- automatically set inlay hints (type hints)
  -- default: true
  auto = true,

  -- Only show inlay hints for the current line
  only_current_line = false,

  -- whether to show parameter hints with the inlay hints or not
  -- default: true
  show_parameter_hints = true,

  -- prefix for parameter hints
  -- default: "<-"
  parameter_hints_prefix = "<- ",

  -- prefix for all the other hints (type, chaining)
  -- default: "=>"
  other_hints_prefix = "=> ",

  -- whether to align to the length of the longest line in the file
  max_len_align = false,

  -- padding from the left if max_len_align is true
  max_len_align_padding = 1,

  -- whether to align to the extreme right or not
  right_align = false,

  -- padding from the right if right_align is true
  right_align_padding = 7,

  -- The color of the hints
  highlight = "Comment",
}

require('lsp_hints').setup({
    auto = false,
})
```

## Usage
```lua
local lsp_hints = require('lsp_hints')

vim.api.nvim_create_autocmd('LspAttach', {
    -- ...
    callback = function(event)
        -- ...

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client.supports_method('textDocument/inlayHint') then
            -- inlay hint keybinds
        end
    end
})
```
