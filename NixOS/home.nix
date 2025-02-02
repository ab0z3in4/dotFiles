{ config, lib, pkgs, ... }:

{
  home-manager.users.ab0z3in4 = {
    home.enableNixpkgsReleaseCheck = false;

    # ZSH Shell
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "thefuck" ];
        theme = "robbyrussell";
      };
    };

    # Alacritty
    programs.alacritty = {
      enable = true;
      settings = {
        colors = {
          bright = {
            black = "#545454";
            blue = "#94bff3";
            cyan = "#93e0e3";
            green = "#8ae234";
            magenta = "#b294bb";
            red = "#fc5454";
            white = "#ffffff";
            yellow = "#fce94f";
          };
          normal = {
            black = "#3f3f3f";
            blue = "#94bff3";
            cyan = "#06989a";
            green = "#4e9a06";
            magenta = "#85678f";
            red = "#cc0000";
            white = "#dcdccc";
            yellow = "#c4a000";
          };
          primary = {
            background = "#000000";
            foreground = "#dddddd";
          };
        };
        cursor = {
          style = {
            shape = "Beam";
            blinking = "Never";
          };
        };
        font = {
          size = 11.0;
          bold = {
            family = "JetBrains Mono Nerd Font";
            style = "Bold";
          };
          bold_italic = {
            family = "JetBrains Mono Nerd Font";
            style = "Bold Italic";
          };
          italic = {
            family = "JetBrains Mono Nerd Font";
            style = "Italic";
          };
          normal = {
            family = "JetBrains Mono Nerd Font";
            style = "Regular";
          };
        };
        keyboard = {
          bindings = [
            {
              action = "ToggleFullscreen";
              key = "F11";
            }
          ];
        };
        scrolling = {
          history = 50000;
        };
        window = {
          opacity = 0.9;
        };
      };
    };

    # virt-manager
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
    };

    # GTK Theme
    gtk = {
      enable = true;
      cursorTheme.name = "Bibata-Modern-Classic";
      cursorTheme.size = 16;
      theme.name = "adw-gtk3-dark";
      font.name = "Cantarell";
      font.size = 10;
      iconTheme.name = "Papirus-Dark";
    };

    # Dunst
    services.dunst = {
      enable = true;
      settings = {
        global = {
          monitor = 0;
          follow = "none";
          width = 300;
          height = "(0,300)";
          origin = "top-center-right";
          offset = "0x30";
          scale = 0;
          notification_limit = 20;
          progress_bar = true;
          progress_bar_height = 10;
          progress_bar_frame_width = 1;
          progress_bar_min_width = 150;
          progress_bar_max_width = 300;
          progress_bar_corner_radius = 10;
          icon_corner_radius = 0;
          indicate_hidden = true;
          transparency = 0;
          separator_height = 2;
          padding = 8;
          horizontal_padding = 8;
          text_icon_padding = 0;
          frame_width = 3;
          frame_color = "#ffffff";
          gap_size = 0;
          separator_color = "frame";
          sort = true;
          font = "Fira Sans Semibold 11";
          line_height = 1;
          markup = "full";
          format = "<b>%s</b>\n%b";
          alignment = "left";
          vertical_alignment = "top";
          show_age_threshold = 60;
          ellipsize = "middle";
          ignore_newline = false;
          stack_duplicates = true;
          hide_duplicate_count = false;
          show_indicators = true;
          enable_recursive_icon_lookup = true;
          icon_theme = "Papirus-Dark,Adwaita";
          icon_position = "left";
          min_icon_size = 32;
          max_icon_size = 128;
          icon_path = "/usr/share/icons/gnome/16x16/status/:/usr/share/icons/gnome/16x16/devices/";
          sticky_history = true;
          history_length = 20;
          dmenu = "/usr/bin/dmenu -p dunst:";
          browser = "/usr/bin/xdg-open";
          always_run_script = true;
          title = "Dunst";
          class = "Dunst";
          corner_radius = 10;
          ignore_dbusclose = false;
          force_xwayland = false;
          force_xinerama = false;
          mouse_left_click = "close_current";
          mouse_middle_click = "do_action, close_current";
          mouse_right_click = "close_all";
        };
        experimental = {
          per_monitor_dpi = false;
        };
        urgency_low = {
          background = "#000000";
          foreground = "#888888";
          timeout = 6;
        };
        urgency_normal = {
          background = "#000000";
          foreground = "#ffffff";
          timeout = 6;
        };
        urgency_critical = {
          background = "#900000";
          foreground = "#ffffff";
          frame_color = "#ffffff";
          timeout = 6;
        };
      };
    };

    # Polybar
    services.polybar = {
      enable = true;
      config = {
        "bar/mainbar" = {
          width = "100%";
          height = "20pt";
          radius = 6;
          background = "#aa000000";
          foreground = "#C5C8C6";
          line-size = "3pt";
          border-size = "3pt";
          border-color = "#00000000";
          padding-left = 0;
          padding-right = 1;
          module-margin = 1;
          separator = "";
          separator-foreground = "#00000000";
          font-0 = "Fira Sans SemiBold:size=11;2";
          font-1 = "Font Awesome 6 Free Solid:pixelsize=11;2";
          modules-left = "xworkspaces xwindow";
          modules-right = "backlight pipewire memory cpu battery xkeyboard date systray";
          cursor-click = "pointer";
          cursor-scroll = "ns-resize";
          enable-ipc = true;
        };
        "module/systray" = {
          type = "internal/tray";
          tray-spacing = "3pt";
        };
        "module/xworkspaces" = {
          type = "internal/xworkspaces";
          icon1=3;
          icon-default = "";
          label-active = "%name%";
          label-active-background = "#C5C8C6";
          label-active-padding = 2;
          label-active-foreground = "#FF000000";
          label-occupied = "%name%";
          label-occupied-padding = 2;
          label-occupied-foreground = "#FFFFFF";
          label-occupied-underline = "#B9C244";
          label-urgent = "%name%";
          label-urgent-background = "#B9C244";
          label-urgent-padding = 2;
          label-empty = "%name%";
          label-empty-foreground = "#FFFFFF";
          label-empty-background= "#aa000000";
          label-empty-padding = 2;
        };
        "module/xwindow" = {
          type = "internal/xwindow";
          label = "%title:0:60:...%";
          format-prefix = "  ";
          format-prefix-foreground = "#00B19F";
          format-foreground = "#FFFFFF";
        };
        "module/xkeyboard" = {
          type = "internal/xkeyboard";
          blacklist-0 = "num lock";
          blacklist-1 = "caps lock";
          format-prefix = " ";
          format-prefix-foreground = "#FBC02D";
          label-layout = "%icon%";
          label-layout-background = "#aa000000";
          label-layout-foreground = "#FFFFFF";
          layout-icon-0 = "us;English";
          layout-icon-1 = "ara;Arabic";
        };
        "module/memory" = {
          type = "internal/memory";
          interval = 2;
          format-prefix = " ";
          format-prefix-foreground = "#5ADECD";
          format-foreground = "#FFFFFF";
          label = "%percentage_used:2%%";
        };
        "module/cpu" = {
          type = "internal/cpu";
          interval = 2;
          format-prefix = " ";
          format-prefix-foreground = "#EC407A";
          format-foreground = "#FFFFFF";
          label = "%percentage:2%%";
        };
        "module/date" = {
          type = "internal/date";
          interval = 1;
          format-prefix = " ";
          format-prefix-foreground = "#6C77BB";
          date = "%I:%M %p";
          date-alt = "%Y-%m-%d %I:%M:%S %p";
          label = "%date%";
          label-foreground = "#FFFFFF";
        };
        "settings" = {
          screenchange-reload = true;
          pseudo-transparency = true;
        };
        "module/battery" = {
          type = "internal/battery";
          label-discharging = "%percentage%%";
          label-discharging-foreground = "#FFFFFF";
          label-full = "100%";
          label-full-foreground = "#FFFFFF";
          label-charging = "%percentage%%";
          label-charging-foreground = "#FFFFFF";
          label-low = "BATTERY LOW";
          label-low-foreground = "#FFFFFF";
          format-discharging-prefix = " ";
          format-discharging-prefix-foreground = "#C574DD";
          format-full-prefix = " ";
          format-full-prefix-foreground = "#C574DD";
          format-charging-prefix = " ";
          format-charging-prefix-foreground = "#C574DD";
          format-low-prefix = " ";
          format-low-prefix-foreground = "#C574DD";
          full-at = 99;
          low-at = 5;
          battery = "BAT0";
          poll-interval = 5;
        };
        "module/backlight" = {
          type = "custom/script";
          exec = "sh -c 'echo $(( $(brightnessctl g) * 100 / $(brightnessctl m) ))'";
          format = "<label>";
          label = "%output%%";
          tail = true;
          scroll-up = "brightnessctl set 5%+";
          scroll-down = "brightnessctl set 5%-";
          format-foreground = "#FFFFFF";
          format-prefix = " ";
          format-prefix-foreground = "#E57C46";
        };
        "module/pipewire" = {
          type = "custom/script";
          exec = "pamixer --get-volume-human";
          tail = true;
          format = "<label>";
          label = "%output%";
          click-left = "pamixer --toggle-mute";
          scroll-up = "pamixer --unmute && pamixer --increase 5";
          scroll-down = "pamixer --unmute && pamixer --decrease 5";
          format-foreground = "#FFFFFF";
          format-prefix = " ";
          format-prefix-foreground = "#8897F4";
        };
      };
      script = "polybar mainbar &";
    };

    # SXHKD
    services.sxhkd = {
      enable = true;
      keybindings = {
        "super + Return" = "alacritty";
        "super + shift + Return" = "nautilus";
        "super + d" = "rofi -show drun";
        "super + Escape" = "pkill -USR1 -x sxhkd";
        "ctrl + alt + f" = "brave";
        "super + x" = "~/.config/bspwm/scripts/powermenu.sh";
        "XF86AudioRaiseVolume" = "~/.config/bspwm/scripts/volume-control.sh up";
        "XF86AudioLowerVolume" = "~/.config/bspwm/scripts/volume-control.sh down";
        "XF86AudioMute" = "~/.config/bspwm/scripts/volume-control.sh mute";
        "super + ctrl + Up" = "~/.config/bspwm/scripts/brightness-control.sh up";
        "super + ctrl + Down" = "~/.config/bspwm/scripts/brightness-control.sh down";
        "super + ctrl + t" = "dunstify \"Your Battary Mode IS $(powerprofilesctl get)\"";
        "super + ctrl + s" = "powerprofilesctl set power-saver && dunstify \"Your Battary Mode IS $(powerprofilesctl get)\"";
        "super + ctrl + b" = "powerprofilesctl set balanced && dunstify \"Your Battary Mode IS $(powerprofilesctl get)\"";
        "super + ctrl + p" = "powerprofilesctl set performance && dunstify \"Your Battary Mode IS $(powerprofilesctl get)\"";
        "Print" = "flameshot gui";
        "super + shift + r" = "bspc wm -r";
        "super + q" = "bspc node -c";
        "super + m" = "bspc desktop -l next";
        "super + g" = "bspc node -s biggest.window";
        "super + shift + space" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
        "super + s" = "bspc node -t floating";
        "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";
        "super + {p,b,comma,period}" = "bspc node -f @{parent,brother,first,second}";
        "super + {_,shift + }c" = "bspc node -f {next,prev}.local.!hidden.window";
        "super + bracket{left,right}" = "bspc desktop -f {prev,next}.local";
        "super + {grave,Tab}" = "bspc {node,desktop} -f last";
        "super + {o,i}" = "bspc wm -h off; bspc node {older,newer} -f; bspc wm -h on";
        "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
        "super + ctrl + {h,j,k,l}" = "bspc node -p {west,south,north,east}";
        "super + ctrl + {1-9}" = "bspc node -o 0.{1-9}";
        "super + ctrl + space" = "bspc node -p cancel";
        "super + ctrl + shift + space" = "bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel";
        "super + alt + {h,j,k,l}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";
        "super + alt + shift + {h,j,k,l}" = "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";
        "super + {Left,Down,Up,Right}" = "bspc node -v {-20 0,0 20,0 -20,20 0}";
      };
    };

    # BSPWM
    xsession.windowManager.bspwm = {
      enable = true;
      settings = {
        border_width = 2;
        window_gap = 2;
        single_monocle = false;
        click_to_focus = true;
        split_ratio = 0.50;
        borderless_monocle = true;
        gapless_monocle = true;
        focus_by_distance = true;
        focus_follows_pointer = true;
        history_aware_focus = true;
        remove_disabled_monitors = true;
        merge_overlapping_monitors = true;
        pointer_modifier = "mod4";
        pointer_action1 = "move";
        pointer_action2 = "resize_side";
        pointer_action3 = "resize_corner";
        normal_border_color = "#4c566a";
        active_border_color = "#1e1e1e";
        focused_border_color = "#5e81ac";
        presel_feedback_color = "#5e81ac";
        urgent_border_color = "#dd2727";
      };
      extraConfig = '' bspc monitor -d 1 2 3 4 5 6 7 8 9 10 '';
      rules = {
        "gnome-calculator" = {
          state = "floating";
        };
        "Blueman-manager" = {
          state = "floating";
        };
        "Pavucontrol" = {
          state = "floating";
        };
        "Gthumb" = {
          state = "floating";
        };
        "File-roller" = {
          state = "floating";
        };
      };
      startupPrograms = [
        "xrandr --output eDP1 --mode 1366x768 --rate 60"
        "pgrep -x sxhkd > /dev/null || sxhkd"
        "pgrep -x polybar > /dev/null || polybar"
        "nitrogen --restore"
        "nm-applet"
        "dunst"
        "copyq"
        "blueman-applet"
        "numlockx on"
        "redshift -O 4500K"
        "xsetroot -cursor_name left_ptr"
      ];
    };

    # Picom
    services.picom = {
      enable = true;
      backend = "glx";
      vSync = true;
      settings = {
        blur = {
          method = "gaussian";
          size = 10;
          deviation = 5.0;
        };
        corner-radius = 8;
      };
      shadow = true;
      shadowExclude = [ "class_g = 'Polybar'" ];
      fade = true;
      fadeSteps = [ 0.028 0.03 ];
    };

    # FontConfig
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [ "Arimo" "Noto Naskh Arabic" ];
        serif = [ "Tinos" "Noto Naskh Arabic" ];
        monospace = [ "Cousine" "Noto Naskh Arabic" ];
      };
    };

    home.stateVersion = "24.11";
  };
}
