local status, _ = pcall(require, "lspconfig")
if not status then
    return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
