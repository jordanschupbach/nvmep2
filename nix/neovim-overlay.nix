# This overlay, when applied to nixpkgs, adds the final neovim derivation to nixpkgs.
{inputs}: final: prev:
with final.pkgs.lib; let
  pkgs = final;

  # Use this to create a plugin from a flake input
  mkNvimPlugin = src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };

  neovimVersion = "v0.11.4";
  neovimSrc = pkgs.fetchFromGithub {
    owner = "neovim";
    repo = "neovim";
    rev = neovimVersion;
    sha256 = ""; # NOTE: why is this not needed!?
  };

  # Make sure we use the pinned nixpkgs instance for wrapNeovimUnstable,
  # otherwise it could have an incompatible signature when applying this overlay.
  pkgs-locked = inputs.nixpkgs.legacyPackages.${pkgs.system};

  # This is the helper function that builds the Neovim derivation.
  mkNeovim = pkgs.callPackage ./mkNeovim.nix {
    inherit (pkgs-locked) wrapNeovimUnstable neovimUtils;
    src = neovimSrc; # NOTE: why does this actually work?
  };

  # A plugin can either be a package or an attrset, such as
  # { plugin = <plugin>; # the package, e.g. pkgs.vimPlugins.nvim-cmp
  #   config = <config>; # String; a config that will be loaded with the plugin
  #   # Boolean; Whether to automatically load the plugin as a 'start' plugin,
  #   # or as an 'opt' plugin, that can be loaded with `:packadd!`
  #   optional = <true|false>; # Default: false
  #   ...
  # }
  all-plugins = let
    TelescopeLuasnip = pkgs.vimUtils.buildVimPlugin {
      name = "telescope-luasnip-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "benfowler";
        repo = "telescope-luasnip.nvim";
        rev = "07a2a2936a7557404c782dba021ac0a03165b343";
        hash = "sha256-9XsV2hPjt05q+y5FiSbKYYXnznDKYOsDwsVmfskYd3M=";
      };
    };

    EasyGrep = pkgs.vimUtils.buildVimPlugin {
      name = "vim-easygrep";
      src = pkgs.fetchFromGitHub {
        owner = "dkprice";
        repo = "vim-easygrep";
        rev = "d0c36a77cc63c22648e792796b1815b44164653a";
        hash = "sha256-bL33/S+caNmEYGcMLNCanFZyEYUOUmSsedCVBn4tV3g=";
      };
    };

    JustNvim = pkgs.vimUtils.buildVimPlugin {
      name = "just-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "al1-ce";
        repo = "just.nvim";
        rev = "14e2c95b2b988bb265da3ee0d546c1ec176dd6e1";
        hash = "sha256-gdgBeNx3npks16Px01oLX7HjyNtCyIqvCbpZsbLVkUM=";
      };
    };

    JsFunc = pkgs.vimUtils.buildVimPlugin {
      name = "jsfunc-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "al1-ce";
        repo = "jsfunc.nvim";
        rev = "ed968840ade89f1d0c95513852a145dca1fe7916";
        hash = "sha256-qQAGTI0BieXI6F/qWNmiQVVVxmTwHQ9vlMendflkAxs=";
      };
    };
  in
    with pkgs.vimPlugins; [
      # plugins from nixpkgs go in here.
      # https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=vimPlugins

      TelescopeLuasnip
      JustNvim
      JsFunc
      EasyGrep
      # dashboard-nvim # https://github.com/nvimdev/dashboard-nvim/
      # nvim-luadev
      # telescope-ultisnips-nvim
      # orgmode
      # jupytext-nvim

      text-case-nvim # https://github.com/johmsalas/text-case.nvim
      friendly-snippets # https://github.com/rafamadriz/friendly-snippets
      asyncrun-vim # https://github.com/skywind3000/asyncrun.vim
      blink-cmp # https://github.com/Saghen/blink.cmp
      refactoring-nvim # https://github.com/ThePrimeagen/refactoring.nvim
      nvim-treesitter-refactor # https://github.com/nvim-treesitter/nvim-treesitter-refactor
      flash-nvim # https://github.com/folke/flash.nvim
      focus-nvim # https://github.com/nvim-focus/focus.nvim
      kanagawa-nvim # https://github.com/rebelot/kanagawa.nvim
      markdown-preview-nvim # https://github.com/iamcco/markdown-preview.nvim
      melange-nvim # https://github.com/savq/melange-nvim
      nerdtree # https://github.com/preservim/nerdtree
      nvim-bqf # https://github.com/kevinhwang91/nvim-bqf
      nvim-dap # https://github.com/mfussenegger/nvim-dap
      nvim-dap-ui # https://github.com/rcarriga/nvim-dap-ui
      nvim-highlight-colors # https://github.com/brenoprata10/nvim-highlight-colors
      oil-nvim # https://github.com/stevearc/oil.nvim
      other-nvim # https://github.com/rgroli/other.nvim
      overseer-nvim # https://github.com/stevearc/overseer.nvim?tab=readme-ov-file
      render-markdown-nvim # https://github.com/MeanderingProgrammer/render-markdown.nvim
      todo-comments-nvim # https://github.com/folke/todo-comments.nvim
      tokyonight-nvim # https://github.com/folke/tokyonight.nvim
      ultisnips # https://github.com/SirVer/ultisnips
      url-open # https://github.com/sontungexpt/url-open
      none-ls-nvim # https://github.com/nvimtools/none-ls.nvim
      conform-nvim # https://github.com/stevearc/conform.nvim
      zen-mode-nvim # https://github.com/folke/zen-mode.nvim

      leetcode-nvim # https://github.com/kawre/leetcode.nvim

      aerial-nvim # https://github.com/stevearc/aerial.nvim
      cmp-buffer # https://github.com/hrsh7th/cmp-buffer/
      cmp-cmdline # https://github.com/hrsh7th/cmp-cmdline
      cmp-cmdline-history #
      cmp-nvim-lsp # https://github.com/hrsh7th/cmp-nvim-lsp/
      cmp-nvim-lsp-signature-help # https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/
      cmp-nvim-lua #https://github.com/hrsh7th/cmp-nvim-lua/
      cmp-path # https://github.com/hrsh7th/cmp-path/
      cmp_luasnip # https://github.com/saadparwaiz1/cmp_luasnip/
      codecompanion-nvim # https://github.com/olimorris/codecompanion.nvim
      copilot-vim # https://github.com/github/copilot.vim/
      diffview-nvim # https://github.com/sindrets/diffview.nvim/
      eyeliner-nvim # https://github.com/jinh0/eyeliner.nvim
      gitsigns-nvim # https://github.com/lewis6991/gitsigns.nvim/
      heirline-nvim # https://github.com/rebelot/heirline.nvim/
      lsp-progress-nvim # https://github.com/linrongbin16/lsp-progress.nvim
      lspkind-nvim # https://github.com/onsails/lspkind.nvim/
      luasnip # https://github.com/l3mon4d3/luasnip/
      neogit # https://github.com/TimUntersberger/neogit/
      nvim-cmp # https://github.com/hrsh7th/nvim-cmp
      nvim-jdtls # https://github.com/mfussenegger/nvim-jdtls
      nvim-navic # https://github.com/SmiteshP/nvim-navic
      nvim-surround # https://github.com/kylechui/nvim-surround/
      nvim-tree-lua # https://github.com/nvim-tree/nvim-tree.lua
      nvim-treesitter-context # nvim-treesitter-context
      nvim-treesitter-textobjects # https://github.com/nvim-treesitter/nvim-treesitter-textobjects/
      nvim-treesitter.withAllGrammars
      nvim-ts-context-commentstring # https://github.com/joosepalviste/nvim-ts-context-commentstring/
      nvim-unception # nvim-unception
      nvim-web-devicons # https://github.com/nvim-tree/nvim-web-devicons
      plenary-nvim # https://github.com/nvim-lua/plenary.nvim
      smart-splits-nvim # https://github.com/mrjones2014/smart-splits.nvim
      sqlite-lua # https://github.com/kkharji/sqlite.lua
      statuscol-nvim # https://github.com/luukvbaal/statuscol.nvim/
      telescope-fzy-native-nvim # https://github.com/nvim-telescope/telescope-fzy-native.nvim
      telescope-nvim # https://github.com/nvim-telescope/telescope.nvim/
      telescope-project-nvim # https://github.com/nvim-telescope/telescope-project.nvim
      vim-fugitive # https://github.com/tpope/vim-fugitive/
      vim-repeat # https://github.com/tpope/vim-repeat
      vim-slime # https://github.com/jpalardy/vim-slime
      vim-unimpaired # https://github.com/tpope/vim-unimpaired/
      which-key-nvim # https://github.com/folke/which-key.nvim
    ];

  extraPackages = with pkgs; [
    # language servers, etc.
    lua-language-server
    nil # nix LSP

    # cpp
    gcc
    gdb
    libclang
    llvm # ??? rudundant?
    cppcheck

    # markdown
    markdownlint-cli2

    # python
    mypy
    pylint
    isort
    black
    python312
    (python312.withPackages (python-pkgs: [
      python-pkgs.numpy
      python-pkgs.python-lsp-server
      python-pkgs.debugpy
    ]))

    # cmake
    cmake
    cmake-lint

    # HTML
    html-tidy

    # javascript
    nodejs_23
    prettierd

    # css
    stylelint
    stylelint-lsp

    # lua
    selene
    lua-language-server

    # fortran
    gfortran

    # nix
    nil # nix LSP
    alejandra
    statix

    # shell
    bash-language-server
    beautysh

    # Java
    jdk
    jdt-language-server

    # latex
    texliveFull
    # textidote

    # typescript
    typescript-language-server
  ];
in {
  # This is the neovim derivation
  # returned by the overlay
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };

  # This is meant to be used within a devshell.
  # Instead of loading the lua Neovim configuration from
  # the Nix store, it is loaded from $XDG_CONFIG_HOME/nvim-dev
  nvim-dev = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
    appName = "nvim-dev";
    wrapRc = false;
  };

  # This can be symlinked in the devShell's shellHook
  nvim-luarc-json = final.mk-luarc-json {
    plugins = all-plugins;
  };

  # You can add as many derivations as you like.
  # Use `ignoreConfigRegexes` to filter out config
  # files you would not like to include.
  #
  # For example:
  #
  # nvim-pkg-no-telescope = mkNeovim {
  #   plugins = [];
  #   ignoreConfigRegexes = [
  #     "^plugin/telescope.lua"
  #     "^ftplugin/.*.lua"
  #   ];
  #   inherit extraPackages;
  # };
}
