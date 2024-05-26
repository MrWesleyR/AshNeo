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
	--	use {'neoclide/coc.nvim', branch = 'release'}
	use 'nvim-lualine/lualine.nvim'
	use 'craftzdog/solarized-osaka.nvim'
	use 'MunifTanjim/nui.nvim'
	use 'wakatime/vim-wakatime'
	use 'lewis6991/gitsigns.nvim'
	use 'norcalli/nvim-colorizer.lua'
	use 'plasticboy/vim-markdown'
	use 'akinsho/toggleterm.nvim'
	use {'glepnir/dashboard-nvim',
		requires = {"nvim-tree/nvim-web-devicons"}
	}
	use 'terryma/vim-multiple-cursors'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'nvim-lua/plenary.nvim'
	use {'nvim-telescope/telescope.nvim', tag = '0.1.*'}
	use { "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim"
		}
	}
	use {'linrongbin16/lsp-progress.nvim' }
	use {'nvim-treesitter/nvim-treesitter',  run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
	}
	use {
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons"
		},
		config = true
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
