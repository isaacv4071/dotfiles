vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

packer.startup(function()
  use 'wbthomason/packer.nvim'

  -- Utils
  use "tpope/vim-fugitive"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use 'numToStr/Comment.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'windwp/nvim-autopairs' -- Autopairs
  use 'christoomey/vim-tmux-navigator' -- Tmux navigation
  use 'sbdchd/neoformat'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Colorschemes
  use 'shaunsingh/nord.nvim'
  -- use 'arcticicestudio/nord-vim'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  -- use 'nvim-telescope/telescope-file-browser.nvim'

  -- DBUI
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-completion'
  use 'kristijanhusak/vim-dadbod-ui'

  -- cmp
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    commit = '668de0951a36ef17016074f1120b6aacbe6c4515',
  }

  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "windwp/nvim-ts-autotag"
  use "p00f/nvim-ts-rainbow"

  -- TS
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'mattn/emmet-vim'

  -- Harpoon
  use {
    'ThePrimeagen/harpoon',
    config = function ()
      require("harpoon").setup({})
    end
  }

  -- RMarkdown
  use 'vim-pandoc/vim-pandoc'
  use 'vim-pandoc/vim-pandoc-syntax'
  use 'vim-pandoc/vim-rmarkdown'

  -- Copilot
  use 'Lucklyric/copilot.vim'
  use 'hrsh7th/cmp-copilot'

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'tjdevries/express_line.nvim'

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
