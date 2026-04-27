return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
    opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "odin", "comment", "python", "gitcommit", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
