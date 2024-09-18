require'nvim-treesitter.configs'.setup {
	ensure_installed = {"ruby", "go", "lua", "vim"},

	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
	endwise = {
        	enable = true,
    	},
}
