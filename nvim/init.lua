-- settings
local g = vim.g
local o = vim.o

o.termguicolors = true
o.number = true
o.relativenumber = true
o.signcolumn = 'yes:2'
o.cursorline = true
o.scrolloff = 8

o.expandtab = true
o.cindent = true

o.wrap = false
o.tabstop = 4

o.clipboard = 'unnamedplus'

o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- keymaps
g.mapleader = ' '
g.maplocalleader = ' '

local function map(m, k, v)
    vim.keymap.set(m, k, v, {
        silent = true
    })
end

-- move lines
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

map('n', '<C-j>', 'k')
map('n', '<C-;>', 'l')

map('n', 'j', 'h')
map('n', 'k', 'j')
map('n', 'l', 'k')
map('n', ';', 'l')
map('i', 'j', 'h')
map('i', 'k', 'j')
map('i', 'l', 'k')
map('i', ';', 'l')
map('x', 'j', 'h')
map('x', 'k', 'j')
map('x', 'l', 'k')
map('x', ';', 'l')

-- save
map('n', '<C-s>', '<CMD>w<CR>')

map('n', '<leader>e', '<CMD>Ex<CR>')

-- local ok, catppuccin = pcall(require, "catppuccin")
local ok, tokyonight = pcall(require, "tokyonight")
if not ok then
    return
end
tokyonight.setup {}
vim.cmd [[colorscheme tokyonight-storm]]

-- plugins & lsp

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr)

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Mappings.
    local opts = {
        noremap = true,
        silent = true
    }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- leaving only what I actually use...
    buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

    buf_set_keymap("n", "<C-j>", "<cmd>Telescope lsp_document_symbols<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

    buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<CR>", opts)
    buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<leader>ca", "<cmd>Telescope lsp_code_actions<CR>", opts)
    buf_set_keymap("n", "gt", "<cmd> lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd> lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<leader>dj", "<cmd> lua vim.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<leader>dk", "<cmd> lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", opts)
    buf_set_keymap("n", "<leader>r", "<cmd> lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<leader>ca", "<cmd> lua vim.lsp.buf.code_action()<CR>", opts)

    -- Set autocommands conditional on server_capabilities
    vim.cmd([[
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]])
end

lsp_installer.setup {}
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true
            },
            checkOnSave = {
                allFeatures = true,
                command = 'clippy'
            },
            procMacro = {
                ignored = {}
            }
        }
    }
})

-- theme
vim.cmd [[colorscheme tokyonight-storm]]
