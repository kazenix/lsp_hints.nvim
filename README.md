# lsp_hints.nvim
this is just an extraction of the rust-tools inlay hints portion, as that was the only bit of the functionality I was using. Now I don't have to do jank things when setting up rust_analyzer and all my keybinds work.

## Usage
```
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
