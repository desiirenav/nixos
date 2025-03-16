{pkgs, config, lib, inputs, ... }: let
  wallpaper = ./w.jpg;  
                                                                          
in { 
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      background_opacity = "0.5";
      background_blur = 1;
    };
  };  

  home.packages = with pkgs; [
    hyprpaper
  ];

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
       general = {
         monitor= ",1920x1080@60,auto,1";
         gaps_in = "10";
	 gaps_out = "10";
         border_size = "2";
         resize_on_border = "false";
         allow_tearing = "false";
         layout = "dwindle";
       };
       decoration = {
         rounding = "5";
	 active_opacity = "1.0";
	 inactive_opacity = "1.0";
	 shadow = {
           enabled = "true";
           range = "4";
           render_power = "3";
         };
	 blur = {
          enabled = "true";
          size = "3";
          passes = "1";
          vibrancy = "0.1696";
         };
       };
       animations = {
         enabled = "yes, please :)";
         bezier = 
	   [
	     "easeOutQuint,0.23,1,0.32,1"
	     "easeInOutCubic,0.65,0.05,0.36,1"
	     "linear,0,0,1,1"
	     "almostLinear,0.5,0.5,0.75,1.0"
	     "quick,0.15,0,0.1,1"
	   ];  

         animation = 
	   [
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
         pseudotile = "true"; 
         preserve_split = "true";
       };
       master = {
         new_status = "master";
       };
       misc = {
         force_default_wallpaper = "0";
         disable_hyprland_logo = "true";
       };
       "$mod" = "SUPER";
       bind = 
         [
	   "$mod, RETURN, exec, kitty"
	   "$mod, Q, killactive"
	   "$mod, M, exit"
	   "$mod, X, exec, rofi -show drun"
	   "$mod, E, exec, ranger"
	   "$mod, V, togglefloating"
	   "$mod, P, pseudo"
	   "$mod, J, togglesplit"
	   "$mod SHIFT, 1, movetoworkspace, 1"
	   "$mod SHIFT, 2, movetoworkspace, 2"
	   "$mod SHIFT, 3, movetoworkspace, 3"
	   "$mod SHIFT, 4, movetoworkspace, 4"
	   "$mod SHIFT, 5, movetoworkspace, 5"
	   "$mod SHIFT, 6, movetoworkspace, 6"
	   "$mod SHIFT, 7, movetoworkspace, 7"
	   "$mod SHIFT, 8, movetoworkspace, 8"
	   "$mod SHIFT, 9, movetoworkspace, 9"
	   "$mod SHIFT, 0, movetoworkspace, 10"
	   "$mod, S, togglespecialworkspace, magic"
	   "$mod SHIFT, S, movetoworkspace, special:magic"
	   "$mod, mouse_down, workspace, e+1"
	   "$mod, mouse_up, workspace, e-1"
	 ];

      bindm = 
        [
	  "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];

      bindel = 
        [
	  ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
	  ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	  ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	  ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
	  ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
	  ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
	];

      bindl = 
        [
	  ", XF86AudioNext, exec, playerctl next"
	  ", XF86AudioPause, exec, playerctl play-pause"
	  ", XF86AudioPlay, exec, playerctl play-pause"
	  ", XF86AudioPrev, exec, playerctl previous"
	];  
      
      exec-once = [
	"hyprpanel"
      ];	

    };
  };

}
