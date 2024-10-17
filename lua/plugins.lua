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
	--Dart & Flutter
	--use 'dart-lang/dart-vim-plugin'
	--use 'thosakwe/vim-flutter'
	--use 'natebosch/vim-lsc'
	--use 'natebosch/vim-lsc-dart'
	--
	use { "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
		}
	}
	use 'wakatime/vim-wakatime'
	use 'lewis6991/gitsigns.nvim'
	use 'norcalli/nvim-colorizer.lua'
	use 'akinsho/toggleterm.nvim'
	use 'glepnir/dashboard-nvim'
	use'feline-nvim/feline.nvim'
	-- Themes	
	--use 'slugbyte/lackluster.nvim'
	--use 'ntk148v/komau.vim'
	--use 'craftzdog/solarized-osaka.nvim'
	--use 'neg-serg/neg.nvim'
	--use 'DeviusVim/deviuspro.nvim'
	--use 'olivercederborg/poimandres.nvim'
	--use 'projekt0n/github-nvim-theme'
	use 'no-clown-fiesta/no-clown-fiesta.nvim'
	--End Themes
	--
	--use 'lukas-reineke/indent-blankline.nvim'
	use {'nvim-telescope/telescope.nvim', tag = '0.1.*'}
	use {'nvim-treesitter/nvim-treesitter',  run = function()
		local ts_update = require('nvim-treesitter.install').update(
			{ with_sync = true })
			ts_update()
    end,
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'onsails/lspkind.nvim'},
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp-signature-help'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

	if packer_bootstrap then
    require('packer').sync()
	end
end)
