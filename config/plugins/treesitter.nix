{ pkgs, ... }:

{
  plugins = {
    # ==================================================
    # 🌳 Treesitter Context
    # ==================================================
    treesitter-context = {
      enable = true;
    };

    # ==================================================
    # 🌲 Treesitter
    # ==================================================
    treesitter = {
      enable = true;

      # Better Nix support
      nixvimInjections = true;
      nixGrammars = true;

      # Folding
      folding.enable = false;

      settings = {
        # Better indentation
        indent.enable = true;

        # ==================================================
        # 🔍 Incremental Selection
        # ==================================================
        incremental_selection = {
          enable = true;

          keymaps = {
            init_selection = "<C-space>";
            node_incremental = "<C-space>";
            node_decremental = "<BS>";

            scope_incremental = false;
          };
        };
      };

      # ==================================================
      # 📦 Treesitter Grammars
      # ==================================================
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        c
        cmake
        cpp
        c_sharp
        gitcommit
        gitignore
        json
        lua
        make
        markdown
        markdown_inline
        nix
        python
        regex
        rust
        toml
        yaml
        zig
      ];
    };

    # ==================================================
    # 🎯 Treesitter Textobjects
    # ==================================================
    treesitter-textobjects = {
      enable = true;

      settings = {
        # ----------------------------------------------
        # 🔍 Selection
        # ----------------------------------------------
        select = {
          enable = true;
          lookahead = true;

          keymaps = {
            af = "@function.outer";
            "if" = "@function.inner";

            ac = "@class.outer";
            ic = "@class.inner";

            aa = "@parameter.outer";
            ia = "@parameter.inner";
          };
        };

        # ----------------------------------------------
        # 🚀 Movement
        # ----------------------------------------------
        move = {
          enable = true;
          set_jumps = true;

          goto_next_start = {
            "]f" = {
              query = "@function.outer";
              desc = "Next function start";
            };

            "]c" = {
              query = "@class.outer";
              desc = "Next class start";
            };
          };

          goto_previous_start = {
            "[f" = {
              query = "@function.outer";
              desc = "Previous function start";
            };

            "[c" = {
              query = "@class.outer";
              desc = "Previous class start";
            };
          };
        };
      };
    };

    # ==================================================
    # 🌈 Rainbow Delimiters
    # ==================================================
    rainbow-delimiters.enable = true;

    # ==================================================
    # 🔗 Auto Tag
    # ==================================================
    ts-autotag.enable = true;

    # ==================================================
    # ✍️ Context-Aware Commenting
    # ==================================================
    ts-context-commentstring.enable = true;
  };
}
