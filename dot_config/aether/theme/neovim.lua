return {
    {
        "bjarneo/aether.nvim",
        branch = "v2",
        name = "aether",
        priority = 1000,
        opts = {
            transparent = false,
            colors = {
                -- Background colors
                bg = "#191f2b",
                bg_dark = "#191f2b",
                bg_highlight = "#8790a3",

                -- Foreground colors
                -- fg: Object properties, builtin types, builtin variables, member access, default text
                fg = "#ffffff",
                -- fg_dark: Inactive elements, statusline, secondary text
                fg_dark = "#d4d0d5",
                -- comment: Line highlight, gutter elements, disabled states
                comment = "#8790a3",

                -- Accent colors
                -- red: Errors, diagnostics, tags, deletions, breakpoints
                red = "#d8aead",
                -- orange: Constants, numbers, current line number, git modifications
                orange = "#f6ebeb",
                -- yellow: Types, classes, constructors, warnings, numbers, booleans
                yellow = "#ce8678",
                -- green: Comments, strings, success states, git additions
                green = "#e09a5c",
                -- cyan: Parameters, regex, preprocessor, hints, properties
                cyan = "#6887b6",
                -- blue: Functions, keywords, directories, links, info diagnostics
                blue = "#8e8ec7",
                -- purple: Storage keywords, special keywords, identifiers, namespaces
                purple = "#c499cc",
                -- magenta: Function declarations, exception handling, tags
                magenta = "#e8d5ec",
            },
        },
        config = function(_, opts)
            require("aether").setup(opts)
            vim.cmd.colorscheme("aether")

            -- Enable hot reload
            require("aether.hotreload").setup()
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "aether",
        },
    },
}
