{lib,config,pkgs,inputs,...}:

{ 
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "rose-pine";
          style = "main";
        };
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        languages = {
          enableLSP = true;
          enableFormat = true;
          enableTreesitter = true;
          nix.enable = true;
          typst = {
            enable = true;
            extensions.typst-preview-nvim.enable = true;
          };
        };
      };
    };
  };
}

