return {
    "saghen/blink.cmp",
    dependencies = {
        -- optional: provides snippets for the snippet source
        "rafamadriz/friendly-snippets",
        "folke/lazydev.nvim",
        "mikavilpas/blink-ripgrep.nvim",
    },
    event = "InsertEnter",
    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        keymap = { preset = "default" },

        completion = {
            accept = { auto_brackets = { enabled = true } },
            documentation = { auto_show = true, auto_show_delay_ms = 500 },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback
        -- to the lua implementation, when the Rust fuzzy matcher is not available, by using
        -- `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" },

        signature = {
            enabled = true,
            trigger = {
                show_on_insert = true,
                show_on_accept = true,
            },
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { "lsp", "path", "snippets", "buffer", "lazydev", "ripgrep" },
            -- Information about any providers that need additional configuration
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
                ripgrep = {
                    module = "blink-ripgrep",
                    name = "Ripgrep",
                    -- the options below are optional, some default values are shown
                    ---@module "blink-ripgrep"
                    ---@type blink-ripgrep.Options
                    opts = {
                        -- For many options, see `rg --help` for an exact description of
                        -- the values that ripgrep expects.

                        -- the minimum length of the current word to start searching
                        -- (if the word is shorter than this, the search will not start)
                        prefix_min_len = 3,

                        backend = {
                            -- The number of lines to show around each match in the preview
                            -- (documentation) window. For example, 5 means to show 5 lines
                            -- before, then the match, and another 5 lines after the match.
                            context_size = 5,

                            -- The maximum file size of a file that ripgrep should include in
                            -- its search. Useful when your project contains large files that
                            -- might cause performance issues.
                            -- Examples:
                            -- "1024" (bytes by default), "200K", "1M", "1G", which will
                            -- exclude files larger than that size.
                            max_filesize = "1M",

                            -- The casing to use for the search in a format that ripgrep
                            -- accepts. Defaults to "--ignore-case". See `rg --help` for all the
                            -- available options ripgrep supports, but you can try
                            -- "--case-sensitive" or "--smart-case".
                            search_casing = "--smart-case",
                        },

                        -- When a result is found for a file whose filetype does not have a
                        -- treesitter parser installed, fall back to regex based highlighting
                        -- that is bundled in Neovim.
                        fallback_to_regex_highlighting = true,
                    },
                    -- (optional) customize how the results are displayed. Many options
                    -- are available - make sure your lua LSP is set up so you get
                    -- autocompletion help
                    transform_items = function(_, items)
                        for _, item in ipairs(items) do
                            -- example: append a description to easily distinguish rg results
                            item.labelDetails = {
                                description = "(rg)",
                            }
                        end
                        return items
                    end,
                },
            },
        },
    },
    opts_extend = { "sources.default" },
}
