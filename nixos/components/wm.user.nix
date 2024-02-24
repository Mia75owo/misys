{ config, lib, pkgs, ... }:

let
  mod = "Mod4";
  mainShell = "kitty";
  mainDmenu = "rofi -show drun";
  mainPowermenu = "";
  mainBrowser = "chromium";

  icons = config.icons;
        
  # Workspace names
  ws1 = "1: ${icons.terminal}";
  ws2 = "2: ${icons.chrome}";
  ws3 = "3: ${icons.steam}";
  ws4 = "4: ${icons.discord}";
  ws5 = "5: ?";
  ws6 = "6: ?";
  ws7 = "7: ?";
  ws8 = "8: ?";
  ws9 = "9: ?";
  ws10 = "10: ${icons.spotify}";

  picom = "${pkgs.picom}/bin/picom";
  feh = "${pkgs.feh}/bin/feh";
  polybar = "/home/mia/.nix-profile/bin/polybar";

in {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;

      fonts = {
        names = [ "FiraCode Nerd" ];
      };

      gaps = {
        inner = 10;
        outer = 0;
      };

      window = {
        titlebar = false;
        border = 1;
      };

      focus = {
        newWindow = "smart";
      };

      # autostart programs
      #exec --no-startup-id nm-applet
      #exec xset r rate 305 50
      #exec dunst
      #exec_always ~/.config/polybar/launch.sh
        
      startup = [
        { command = "${picom}"; always = false; notification = false; }
        { command = "${feh} --bg-scale ${../resources/wallpaper.png}"; always = false; notification = false; }
        { command = "${polybar}"; always = false; notification = false; }
      ];

      # Assign programs to always open in specified workspace
      assigns = {
        "${ws2}" = [
          { class = "Chromium"; }
        ];
        "${ws3}" = [
          { class = "Steam"; }
          { class = "*steam*"; }
          { class = "ATLauncher"; }
          { class = "Terraria*"; }
        ];
        "${ws4}" = [
          { class = "discord"; }
        ];
        "${ws10}" = [
          { class = "Spotify"; }
        ];
      };

      bars = [];
        
      # floating
      floating = {
        titlebar = false;
        criteria = [
          { class = "scrcpy"; }
          { class = "Qemu-system-x86_64"; }
        ];
      };
        
      keybindings = {
        # media-keys
        "XF86AudioRaiseVolume" = "exec --no-startup-id pamixer -i 1";
        "XF86AudioLowerVolume" = "exec --no-startup-id pamixer -d 1";
        "--whole-window --border $mod+shift+button4" = "exec --no-startup-id pamixer -i 2";
        "--whole-window --border $mod+shift+button5" = "exec --no-startup-id pamixer -d 2";
        
        "XF86AudioMute" = "exec --no-startup-id pamixer -t";
        "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "XF86MonBrightnessUp" = "exec brightnessctl s +2%";
        "XF86MonBrightnessDown" = "exec brightnessctl s 2%-";
        
        # The two basic commands (closing windows and opening shells)
        "${mod}+Return" = "exec ${mainShell}";
        "${mod}+q" = "kill";
        
        # =====================================================================
        # Commands to move windows
        # =====================================================================
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
	
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        "${mod}+Shift+Control+h" = "move workspace to output left";
        "${mod}+Shift+Control+j" = "move workspace to output down";
        "${mod}+Shift+Control+k" = "move workspace to output up";
        "${mod}+Shift+Control+l" = "move workspace to output right";
        
        # splits
        "${mod}+b" = "split h";
        "${mod}+v" = "split v";
        
        # fullscreen
        "${mod}+f" = "fullscreen toggle";
        
        # floating keys
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";
        
        # go to workspaces
        "${mod}+1" = "workspace number ${ws1}";
        "${mod}+2" = "workspace number ${ws2}";
        "${mod}+3" = "workspace number ${ws3}";
        "${mod}+4" = "workspace number ${ws4}";
        "${mod}+5" = "workspace number ${ws5}";
        "${mod}+6" = "workspace number ${ws6}";
        "${mod}+7" = "workspace number ${ws7}";
        "${mod}+8" = "workspace number ${ws8}";
        "${mod}+9" = "workspace number ${ws9}";
        "${mod}+0" = "workspace number ${ws10}";
        
        # move to workspaces
        "${mod}+Shift+1" = "move container to workspace number ${ws1}";
        "${mod}+Shift+2" = "move container to workspace number ${ws2}";
        "${mod}+Shift+3" = "move container to workspace number ${ws3}";
        "${mod}+Shift+4" = "move container to workspace number ${ws4}";
        "${mod}+Shift+5" = "move container to workspace number ${ws5}";
        "${mod}+Shift+6" = "move container to workspace number ${ws6}";
        "${mod}+Shift+7" = "move container to workspace number ${ws7}";
        "${mod}+Shift+8" = "move container to workspace number ${ws8}";
        "${mod}+Shift+9" = "move container to workspace number ${ws9}";
        "${mod}+Shift+0" = "move container to workspace number ${ws10}";
        
        # mousewheel
        "--whole-window --border ${mod}+button4" = "workspace prev";
        "--whole-window --border ${mod}+button5" = "workspace next";
        
        # restart i3
        "${mod}+Shift+r" = "restart";
        
        "${mod}+r" = "mode \"resize\"";
        
        # scratchpad
        "${mod}+shift+a" = "move scratchpad";
        "${mod}+a" = "scratchpad show";
        
        # programs
        "${mod}+d" = "exec ${mainDmenu}";
        "${mod}+o" = "exec ${mainBrowser}";
        "${mod}+x" = "exec ${mainPowermenu}";
        
        # for screenshots
        "${mod}+shift+s" = "exec flameshot gui";
      };

      modes = {
        resize = {
          "h" = "resize shrink width 1 px or 1 ppt";
          "j" = "resize grow height 1 px or 1 ppt";
          "k" = "resize shrink height 1 px or 1 ppt";
          "l" = "resize grow width 1 px or 1 ppt";

          "Left" = "resize shrink width 1 px or 1 ppt";
          "Down" = "resize grow height 1 px or 1 ppt";
          "Up" = "resize shrink height 1 px or 1 ppt";
          "Right" = "resize grow width 1 px or 1 ppt";

          "Return" = "mode \"default\"";
          "Escape" = "mode \"default\"";
          "$mod+r" = "mode \"default\"";
        };
      };
    };
  };

  programs.feh.enable = true;
}
