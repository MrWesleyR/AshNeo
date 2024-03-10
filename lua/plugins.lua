local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

	use {'neoclide/coc.nvim', branch = 'release'}
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'akinsho/bufferline.nvim'
	use 'craftzdog/solarized-osaka.nvim'
	use 'wakatime/vim-wakatime'
	use 'lewis6991/gitsigns.nvim'
	use 'ap/vim-css-color'
	use 'plasticboy/vim-markdown'
	use 'akinsho/toggleterm.nvim'
	use 'glepnir/dashboard-nvim'
	use 'terryma/vim-multiple-cursors'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'nvim-lua/plenary.nvim'
	use {'nvim-telescope/telescope.nvim', tag = '0.1.*'}
	use {'nvim-treesitter/nvim-treesitter',  run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,}

	if packer_bootstrap then
    require('packer').sync()
	end
end)
