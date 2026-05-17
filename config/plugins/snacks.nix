{
  plugins.snacks = {
    enable = true;

    settings = {
      explorer = {
        enabled = true;
      };

      notifier = {
        enabled = true;
      };

      scratch = null;

      dashboard = {
        enabled = true;

        preset = {
          header = ''
             ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
             ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
             ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
             ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
             ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
             ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
          '';

          keys = [
            {
              icon = " ";
              key = "f";
              desc = "Find File";
              action = ":lua Snacks.picker.files()";
            }

            {
              icon = " ";
              key = "e";
              desc = "Explorer";
              action = ":lua Snacks.explorer()";
            }

            {
              icon = " ";
              key = "g";
              desc = "Find Text";
              action = ":lua Snacks.picker.grep()";
            }

            {
              icon = " ";
              key = "r";
              desc = "Recent Files";
              action = ":lua Snacks.picker.recent()";
            }

            {
              icon = " ";
              key = "c";
              desc = "Config";
              action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })";
            }

            {
              icon = "󰒲 ";
              key = "l";
              desc = "Lazy";
              action = ":Lazy";
            }

            {
              icon = " ";
              key = "q";
              desc = "Quit";
              action = ":qa";
            }
          ];
        };

        sections = [
          {
            section = "header";
          }

          {
            section = "keys";
            gap = 1;
            padding = 1;
          }
        ];
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>lua Snacks.explorer()<CR>";
      options.desc = "File Explorer";
    }
  ];
}
