{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];
  documentation.nixos.enable = false;

  # File Systems
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
    "/mnt/Data" = {
      device = "/dev/sda5";
      fsType = "ntfs";
      options = [ "defaults" "uid=1000" "gid=1000" "fmask=0133" "dmask=022" ];
    };
  };

  # Enable Unfree Software
  nixpkgs.config.allowUnfree = true;

  # Use the grub EFI boot loader.
  boot = {
    kernelParams = ["nohibernate"];
    tmp.cleanOnBoot = true;
    supportedFilesystems = ["ntfs"];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        device = "nodev";
        efiSupport = true;
        enable = true;
        useOSProber = true;
        timeoutStyle = "menu";
      };
      timeout = 5;
    };
    kernelModules = ["tcp_bbr" "kvm-amd" "kvm-intel" ];
    kernel.sysctl = {
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "fq";
      "net.core.wmem_max" = 1073741824;
      "net.core.rmem_max" = 1073741824;
      "net.ipv4.tcp_rmem" = "4096 87380 1073741824";
      "net.ipv4.tcp_wmem" = "4096 87380 1073741824";
    };
  };

  # Networking
  networking = {
    hostName = "ab0z3in4-PC";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  # Set your time zone.
  time.timeZone = "Africa/Cairo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_EG.utf8";
  };

  services = {
    dbus.enable = true;
    power-profiles-daemon.enable = true;
    libinput.enable = true;
    picom.enable = true;
    xserver = {
      enable = true;
      # Nvidia Drivers
      videoDrivers = ["nvidia"];
      windowManager.bspwm.enable = true;
      xkb = {
        layout = "us,ara";
        variant = "qwerty";
        model = "pc105";
        options = "grp:win_space_toggle";
      };
    };
    displayManager = {
      sddm = {
        enable = true;
        theme = "sugar-dark";
      };
    };
  };

  # Nvidia Drivers
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0"; # Replace with actual Intel GPU Bus ID (lspci | grep VGA)
    nvidiaBusId = "PCI:14:0:0"; # Replace with actual NVIDIA GPU Bus ID (lspci | grep VGA)
  };

  # Enable sound.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ab0z3in4 = {
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "libvirtd" ];
  };

  environment.sessionVariables = rec {
    GTK_THEME="adw-gtk3-dark";
    EDITOR="vim";
    BROWSER="firefox";
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    git
    unzip
    unrar
    efibootmgr
    grub2
    neovim
    nodejs
    python3
    gcc
    wget
    htop
    neofetch
    firefox
    sddm
    sddm-sugar-dark
    alacritty
    bspwm
    sxhkd
    polybar
    picom
    nitrogen
    polkit_gnome
    dunst
    numlockx
    udiskie
    rofi
    starship
    copyq
    xfce.xfce4-power-manager
    redshift
    networkmanagerapplet
    nautilus
    nautilus-open-any-terminal
    pamixer
    power-profiles-daemon
    flameshot
    gnome-calculator
    mpv
    gthumb
    file-roller
    libsForQt5.qt5.qtgraphicaleffects
    xdg-desktop-portal-gtk
    gnome-keyring
    adwaita-qt
    adw-gtk3
    bibata-cursors
    papirus-icon-theme
    burpsuite
    telegram-desktop
    whatsapp-for-linux
  ];

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerdfonts
    cantarell-fonts
    cascadia-code
    fira-code
    fira-code-symbols
    liberation_ttf
    fira-sans
    hack-font
    font-awesome
    fira-code
    jetbrains-mono
    open-sans
  ];

  # QT Themes
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  # Virtualisation
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # ZRAM SWAP
  zramSwap = {
    enable = true;
    algorithm = "lz4";
    memoryPercent = 50;
    priority = 999;
  };

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  security.polkit.enable = true;

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  system.stateVersion = "24.11";
}
