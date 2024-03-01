{ config, lib, pkgs, ... }:

let
  icons = config.icons;
  colors = config.colors;
in
{
  services = {
    polybar = {
      enable = true;

      package = pkgs.polybar.override {
        i3Support = true;
        pulseSupport = true;
        iwSupport = true;
        githubSupport = true;
      };

      script = "";

      config =
        let
          background = colors.base;
          background-alt = colors.base;

          foreground = colors.text;
          foreground-alt = colors.text;

          primary = colors.pink;
          secondary = colors.mauve;
          alert = colors.red;

          fonts = {
            font-0 = "FiraCode Nerd Font Mono:pixelsize=13;4";
            font-1 = "FiraCode Nerd Font Mono:size=24;7";
            font-2 = "FiraCode Nerd Font Mono:size=22;7";
          };
        in
        {
          "bar/main" = fonts // {
            height = 27;
            radius = 0;
            fixed-center = true;
            bottom = true;

            background = background;
            foreground = foreground;

            border-size = 0;

            padding-left = 0;
            padding-right = 0;

            module-margin-left = 1;
            module-margin-right = 1;

            modules-left = "i3";
            modules-center = "";
            modules-right = "xbacklight sep pulse sep battery sep cpu sep spotify sep date tray";

            scroll-up = "i3wm-wsnext";
            scroll-down = "i3wm-wsprev";
          };

          "settings" = {
            screenchange-reload = "true";
            pseudo-transparency = true;
          };

          "global/wm" = {
            margin-top = 2;
            margin-bottom = 2;
          };

          "module/sep" = {
            type = "custom/text";
            label = "|";
            label-foreground = primary;
          };

          "module/i3" = {
            type = "internal/i3";
            format = "<label-state> <label-mode>";
            index-sort = true;
            wrapping-scroll = false;
            strip-wsnumbers = true;

            # Only show workspaces on the same output as the bar
            pin-workspaces = false;

            label-mode-padding = 2;
            label-mode-foreground = "#000";
            label-mode-background = primary;

            # focused = "Active workspace on focused monitor";
            label-focused = "%{T2}%name%%{T-}";
            label-focused-background = primary;
            label-focused-foreground = background;
            label-focused-padding = 2;

            # unfocused = "Inactive workspace on any monitor";
            label-unfocused = "%{T2}%name%%{T-}";
            label-unfocused-background = background;
            label-unfocused-padding = 2;

            # visible = "Active workspace on unfocused monitor";
            label-visible = "%{T2}%name%%{T-}";
            label-visible-background = secondary;
            label-visible-padding = 2;

            # urgent = "Workspace with urgency hint set";
            label-urgent = "%{T2}%name%%{T-}";
            label-urgent-background = alert;
            label-urgent-padding = 2;
          };

          "module/xbacklight" = {
            type = "internal/xbacklight";

            format = "<label> <bar>";
            label = "BL";

            bar-width = "10";
            bar-indicator = "|";
            bar-indicator-foreground = "#ff";
            bar-indicator-font = "2";
            bar-fill = "─";
            bar-fill-font = "2";
            bar-fill-foreground = "#9f78e1";
            bar-empty = "─";
            bar-empty-font = "2";
            bar-empty-foreground = foreground-alt;
          };
          "module/backlight-acpi" = {
            "inherit" = "module/xbacklight";
            type = "internal/backlight";
            card = "intel_backlight";
          };

          "module/pulse" = {
            type = "internal/pulseaudio";

            master-soundcard = "default";
            speaker-soundcard = "default";
            headphone-soundcard = "default";

            master-mixer = "Master";
            interval = "5";

            format-volume = "<ramp-volume> <label-volume>";
            format-volume-background = background;
            label-volume = "%percentage%%";

            format-muted = "<label-muted>";
            format-muted-prefix = "%{T2}${icons.volume-muted}%{T-}";
            format-muted-background = background;
            label-muted = " Muted";
            label-muted-foreground = foreground;

            ramp-volume-0 = "%{T2}${icons.volume-0}%{T-}";
            ramp-volume-1 = "%{T2}${icons.volume-1}%{T-}";
            ramp-volume-2 = "%{T2}${icons.volume-2}%{T-}";
          };

          "module/battery" = {
            type = "internal/battery";
            battery = "BAT0";
            adapter = "AC";
            full-at = "98";

            format-charging = "<label-charging>";
            format-charging-prefix = "%{T3}${icons.battery-charging} %{T-}";
            format-charging-prefix-foreground = foreground;

            format-discharging = "<label-discharging> <ramp-capacity>";
            label-discharging = "%percentage%%";
            ramp-capacity-0 = "${icons.battery-0}";
            ramp-capacity-1 = "${icons.battery-1}";
            ramp-capacity-2 = "${icons.battery-2}";
            ramp-capacity-foreground = foreground;

            format-full = "Full";
            format-full-prefix = "%{T3}${icons.battery-charging} %{T-}";
            format-full-prefix-foreground = foreground;
          };

          "module/cpu" = {
            type = "internal/cpu";
            interval = 2;

            format-prefix-foreground = foreground-alt;
            label = " %percentage%%";
            format-prefix = "%{T2}${icons.cpu}%{T-}";
          };

          "module/spotify" =
            let
              polybar-spotify =
                pkgs.callPackage "${../resources/polybar-spotify}" { };
            in
            {
              type = "custom/script";
              exec = "${polybar-spotify}/bin/polybar-spotify %xesam:artist% - %xesam:title%";
              tail = true;
              interval = 2;
            };

          "module/date" = {
            type = "internal/date";
            interval = "5";

            time = "%H:%M:%S";
            time-alt = "%H:%M:%S";

            label = "%{T2}${icons.date}%{T-} %time% ";
          };

          "module/tray" = {
            type = "internal/tray";
          };
        };
    };
  };
}
