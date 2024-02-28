{ pkgs, ... }:
{
  xdg.configFile.hypr = {
    source = ./hyprpaper;
    recursive = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      monitor = [
        "eDP-1,2256x1504,0x0,1"
      ];

      exec-once = [
        "waybar"
        "hyprpaper"
      ];

      input = {
        follow_mouse = true;
        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = true;
      };
      
      general = {
        border_size = 0;
      };

      decoration = {
        rounding = 5;
      };

      "$mod" = "SUPER";
      bind =
        [
	      "$mod SHIFT, q, exit"
	      "$mod, t, exec, kitty"
          "$mod, q, killactive"
          "$mod, p, exec, wofi --show run"
          # media keys
          ",XF86MonBrightnessUp, exec, brightnessctl s +5%"
          ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
        );
    };
  };
}
