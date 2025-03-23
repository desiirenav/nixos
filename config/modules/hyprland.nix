{pkgs, config, lib, inputs, ... }: 

let
  wallpaper = ./bay.JPG;
  mainMod = "SUPER";
  workspaceKeys = lib.range 1 9;
  workspaceSwitch = (map (num: "${mainMod}, ${toString num}, workspace, ${toString num}") workspaceKeys) ++ ["${mainMod}, 0, workspace, 10"];
  moveToWorkspace = (map (num: "${mainMod} SHIFT, ${toString num}, movetoworkspace, ${toString num}") workspaceKeys) ++ ["${mainMod} SHIFT, 0, movetoworkspace, 10"];

in {
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      background_opacity = "1";
      background_blur = 1;
    };
  };  

  home.packages = with pkgs; [ hyprpaper hyprpanel ];

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["${wallpaper}"];
      wallpaper = [",${wallpaper}"];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ",preferred,auto,auto";
      
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      general = {
        gaps_in =  10;
        gaps_out = 10;
        border_size = 2;
        resize_on_border = "no";
        allow_tearing = "no";
        layout = "dwindle"; 
      };

      decoration = {
        rounding = 4;
        active_opacity = "1.0";
        inactive_opacity = "1.0";
        shadow = {
          enabled = "yes";
          range = "4";
          render_power = "3";
        };
        blur = {
          enabled = "yes";
          size = "3";
          passes = "1";
          vibrancy = "0.1696";
        };
      };

      animations = {
        enabled = "yes";
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master.new_status = "master";

      misc = {
        force_default_wallpaper = "-1";
        disable_hyprland_logo = "true";
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad.natural_scroll = "no";
      };

      gestures.workspace_swipe = "no";

      device = {
        name = "epic-mouse-v1";
        sensitivity = "-0.5";
      };

      "$mod" = mainMod;

      bind = workspaceSwitch ++ moveToWorkspace ++ [
        "$mod, RETURN, exec, kitty"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, X, exec, rofi -show drun"
        "$mod, E, exec, yazi"
        "$mod, V, togglefloating"
        "$mod, P, pseudo"
        "$mod, J, togglesplit"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      exec-once = [
	"hyprpanel"
      ];	
    };
  };
}


