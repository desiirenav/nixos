{lib,config,pkgs,inputs,...}:

{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    configure = { 
      customRC = ''
        set number
      '';
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
      bind - split-window -v
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
