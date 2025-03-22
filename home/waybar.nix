{
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "graphical-session.target";
    };
    style = ''
      * {
        font-family: "BlexMono Nerd Font", sans-serif;
        font-size: 13px;
        min-height: 0;
        border: none;
        border-radius: 0;
        margin: 0;
        padding: 0;
      }

      #waybar {
        background: rgba(40, 40, 40, 0.0);
        color: #ebdbb2;
        margin: 5px 5px;
        border-radius: 8px;
      }

      #workspaces button {
        background-color: rgba(60, 56, 54, 0.6);
        padding: 0 8px;
        color: #ebdbb2;
        border-radius: 4px;
        margin: 4px 2px;
      }

      #workspaces button.active {
        background-color: #98971a;
        color: #282828;
      }

      #workspaces button:hover {
        background-color: #504945;
        color: #ebdbb2;
      }

      .modules-left, .modules-center, .modules-right {
        padding: 0 8px;
      }

      #clock, #window, #cpu, #memory, #temperature, #backlight, #battery, #custom-media, #tray {
        padding: 0 8px;
        margin: 4px 2px;
        background-color: rgba(60, 56, 54, 0.6);
        border-radius: 4px;
      }

      #clock {
        color: #fabd2f;
      }

      #cpu {
        color: #b8bb26;
      }

      #memory {
        color: #fe8019;
      }

      #temperature {
        color: #d3869b;
      }

      #temperature.critical {
        color: #fb4934;
      }

      #backlight {
        color: #d3869b;
      }

      #battery {
        color: #b8bb26;
      }

      #battery.charging {
        color: #b8bb26;
      }

      #battery.warning:not(.charging) {
        color: #fabd2f;
      }

      #battery.critical:not(.charging) {
        color: #fb4934;
      }

      #tray {
        background-color: rgba(60, 56, 54, 0.6);
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 0;
        spacing = 0;

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "cpu"
          "memory"
          "temperature"
          "tray"
        ];

        "hyprland/workspaces" = {
          format = "{name}";
          active-only = false;
          on-click = "activate";
        };

        "hyprland/window" = {
          max-length = 50;
          separate-outputs = true;
        };

        "clock" = {
          format = "{:%H:%M}";
          format-alt = "{:%Y-%m-%d %H:%M:%S}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          interval = 1;
        };

        "cpu" = {
          format = "cpu: {usage}%";
          tooltip = true;
          interval = 2;
        };

        "memory" = {
          format = "mem: {percentage}%";
          tooltip-format = "{used:0.1f}GiB / {total:0.1f}GiB";
          interval = 2;
        };

        "temperature" = {
          thermal-zone = 2;
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          format = "{icon} {temperatureC}°C";
          format-critical = "{icon} {temperatureC}°C";
          format-icons = ["" "" ""];
          interval = 5;
        };

        "tray" = {
          icon-size = 16;
          spacing = 10;
        };
      };
    };
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    });
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.blex-mono
  ];
}
