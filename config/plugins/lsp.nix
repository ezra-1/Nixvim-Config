{
  plugins = {
    nix.enable = true;
    crates.enable = true;

    lsp = {
      enable = true;

      servers = {
        rust_analyzer = {
          enable = true;

          settings = {
            diagnostics.enable = true;

            # Disable postfix snippets if no snippet engine is installed
            # completion.postfix.enable = false;
          };

          installCargo = true;
          installRustc = true;
        };

        lua_ls.enable = true;
        yamlls.enable = true;
        nil_ls.enable = true;
        marksman.enable = true;
        pyright.enable = true;
        bashls.enable = true;
        clangd.enable = true;
        cmake.enable = true;
        csharp_ls.enable = true;
        gopls.enable = true;
        jsonls.enable = true;
        ts_ls.enable = true;

        # Optional servers
        # gdscript.enable = true;
        # pylsp.enable = true;
        # html.enable = true;
        # volar.enable = true;
        # terraformls.enable = true;
        # ansiblels.enable = true;
      };

      keymaps = {
        silent = true;

        diagnostic = {
          "<leader>k" = "goto_prev";
          "<leader>j" = "goto_next";
        };

        lspBuf = {
          "gd" = "definition";
          "gD" = "declaration";
          "gi" = "implementation";
          "gr" = "references";
          "gt" = "type_definition";

          "K" = "hover";
          "<C-k>" = "signature_help";

          "<leader>ca" = "code_action";
          "<leader>rn" = "rename";

          "<leader>wa" = "add_workspace_folder";
          "<leader>wr" = "remove_workspace_folder";
        };
      };
    };
  };
}
