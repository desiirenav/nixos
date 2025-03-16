{lib,config,pkgs,inputs,...}

{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''
      set number relativenumber
    '';
  };

}
