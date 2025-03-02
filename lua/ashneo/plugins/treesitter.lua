-- Treesitter 
require'nvim-treesitter.configs'.setup {
		ensure_installed={
		'c','lua','vim',
		'vimdoc','query',
		'php','json',
		'javascript',
		'typescript',
		'gitcommit',
		'html','css'
	},
    sync_install=false,
    auto_install=true,
    indent = {
       enable = true
    },
    highlight={
        enable=true,
        disable={'c'},
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    }
}

