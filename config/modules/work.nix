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
          typst.enable = true;
        };
      };
    };
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = ''
      # remap prefix from 'C-b' to 'C-a'
      unbind C-b
      set -g prefix C-a
      bind C-a send-prefix
      # split panes using | and -
      bind | split-window -h
      bind v split-window -v
      unbind '"'
      unbind %
      # reload config file
      bind r source-file ~/.tmux.conf
      # switch panes using Alt-arrow without prefix
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D
      # Enable mouse control
      set -g mouse on
      # don't rename windows automatically
      set-option -g allow-rename off
    '';
  };

}
