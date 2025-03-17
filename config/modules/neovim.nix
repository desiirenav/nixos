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
      # remap prefix from 'C-b' to 'C-w'
      # unbind C-b
      set-option -g prefix C-b # Because I am already use to this on vim
      bind-key C-b send-prefix

      # Mouse support: switching pane
      setw -g mouse on

      #Default shell: /usr/bin/fish
      set-option -g default-shell /etc/profiles/per-user/study/bin/fish

      # Meaningful panel title
      set-option -g set-titles on
      set-option -g set-titles-string '#H:#S.#I.#P #W #T' # window number,program name, active(or not)

      # 1-based indexing for panels default is 0 and 0 is not close to 1,2,3,4... on a
      # most keyboard for some reason.

      set -g base-index 1

      # setw -g aggressive-resize on

      #vertical and horizontal split that actuall make sense
      bind-key h split-window -h
      bind-key v split-window -v


      # vim keybinding to navigate the panel
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # So you don't have to press the direction key multiple times
      # https://superuser.com/questions/1560523/how-do-i-resize-tmux-pane-by-holding-down-prefix-and-arrow-key-for-a-while

      set -g repeat-time 1000

      # Truecolor to pimp your terminal
      set-option -sa terminal-overrides ",xterm*:Tc"

      # Create a new tmux session with a name
      bind-key S command-prompt -p ssh: "new-window -n %1 'ssh %1'"

      # reload the config with r
      bind-key r source-file ~/.tmux.conf
    '';
  };

}
