-- Until I figure out how to tell Lua that vim is not an undeclared global,
-- only have that show up once.
local v = vim

v.g.t_co = 256
v.g.background = "dark"
require("gruvbox").setup({
	transparent_mode = true,
})
v.cmd([[colorscheme gruvbox]])

-- Must occur prior to plugin setups
v.g.mapleader = ','
v.g.maplocalleader = ','

-- See `:help vim.keymap.set()`
v.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
v.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
v.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
v.opt.hidden = true
v.opt.number = true
v.opt.signcolumn = 'yes'
v.opt.smarttab = true
v.opt.ignorecase = true
v.opt.smartcase = true
v.opt.hlsearch = true
v.opt.incsearch = true
v.opt.autoindent = true
v.opt.copyindent = true
v.opt.backspace = {'indent', 'eol', 'start'}
v.opt.showmatch = true
v.opt.cursorline = true
v.opt.colorcolumn = "80"
v.opt.pastetoggle = "<F2>"
v.opt.spell = true

v.opt.lazyredraw = true

-- Default shift / tabwidth
v.opt.expandtab = true
v.opt.tabstop = 4
v.opt.shiftwidth = 4

require('packer').startup(function(use)
    -- [[ Plugins Go Here ]]
    use { 'wbthomason/packer.nvim' }

    -- [[ Theme ]]
    use {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
        config = function()
            require"startup".setup()
        end
    }
    use { 'DanilaMihailov/beacon.nvim' }  -- cursor jump
    use {
        'nvim-lualine/lualine.nvim',  -- statusline
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use { "ellisonleao/gruvbox.nvim" }

    -- [[ Dev ]]
    use {
        'nvim-telescope/telescope.nvim',  -- fuzzy finder
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use { 'majutsushi/tagbar' }  -- code structure
    use { 'lukas-reineke/indent-blankline.nvim' }  -- see indentation
    use { 'tpope/vim-fugitive' }  -- git integration
    use { 'junegunn/gv.vim' }  -- commit history
    use { 'windwp/nvim-autopairs' }  -- auto close brackets, etc.
    use { 'tpope/vim-commentary' }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- [[ LSP ]]
    use {
        "williamboman/mason-lspconfig.nvim",
        requires = {"neovim/nvim-lspconfig", "williamboman/mason.nvim"},
        run = ":MasonUpdate" -- update registry contents
    }
    use { 'neovim/nvim-lspconfig' }  -- Configurations for Nvim LSP
    use { 'hrsh7th/nvim-cmp' }  -- Autocompletion plugin
    use { 'hrsh7th/cmp-nvim-lsp' }  -- LSP source for nvim-cmp
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {
        'saadparwaiz1/cmp_luasnip',  -- Snippets source for nvim-cmp
        requires = { 'L3MON4D3/LuaSnip' }  -- Snippets plugin
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
end)

v.api.nvim_create_autocmd('User', {
    pattern = 'LspAttached',
    desc = 'LSP actions',
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            local opts = {buffer = true}
            v.keymap.set(mode, lhs, rhs, opts)
        end

        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        bufmap('n', 'gr', require('telescope.builtin').lsp_references)
        bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
        bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
        bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
        bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
    end
})

require('lualine').setup {
    options = {
        theme = 'gruvbox',
    },
}
require('nvim-autopairs').setup({})

require('startup').setup({theme = "dashboard"})

require('nvim-treesitter.configs').setup {
    ensure_installed = {"bash", "c", "lua", "markdown", "markdown_inline", "python", "rust", "vim"},
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
}

-- trouble setup
v.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
v.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
v.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
v.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
v.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
v.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

v.opt.list = true
v.opt.listchars:append "eol:↴"
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
}

-- luasnip setup
-- nvim-cmp setup
v.opt.completeopt = {'menu', 'menuone', 'noselect'}

require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp', keyword_length = 3},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
    mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),

        ['<C-d>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, {'i', 's'}),

        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'}),

        ['<Tab>'] = cmp.mapping(function(fallback)
            local col = v.fn.col('.') - 1

            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif col == 0 or v.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, {'i', 's'}),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                fallback()
            end
        end, {'i', 's'}),
    },
})


-- LSP setup
local servers = { 'rust_analyzer', 'pylsp', 'lua_ls' }
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true,
})

local lsp_defaults = {
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(
        v.lsp.protocol.make_client_capabilities()
    ),
    on_attach = function(client, bufnr)
        v.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
    end
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = v.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
)

-- Only have language servers load once
if v.g.lsp_setup_ready == nil then
    v.g.lsp_setup_ready = true

    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({})
    end
end

v.lsp.handlers['textDocument/hover'] = v.lsp.with(
    v.lsp.handlers.hover,
    {border = 'rounded'}
)

v.lsp.handlers['textDocument/signatureHelp'] = v.lsp.with(
    v.lsp.handlers.signature_help,
    {border = 'rounded'}
)

-- Signs
v.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

local sign = function(opts)
    v.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})
