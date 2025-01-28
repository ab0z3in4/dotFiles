{ config, lib, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
in

{
  imports =
    [
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
      ./home.nix
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
      options = [ "defaults" "uid=1000" "gid=100" "fmask=0133" "dmask=022" ];
    };
  };

  # Enable Unfree Software
  nixpkgs.config.allowUnfree = true;

  # Use the grub EFI boot loader.
  boot = {
    plymouth = {
      enable = true;
    };
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "nohibernate"
      "apparmor=1"
      "security=apparmor"
    ];
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
    kernelModules = [ "tcp_bbr" "nvidia" "nvidia_modeset" "nvidia-uvm" "nvidia_drm" "kvm-intel" ];
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
    blueman.enable = true;
    libinput.enable = true;
    picom.enable = true;
    xserver = {
      enable = true;
      windowManager.bspwm.enable = true;
      xkb = {
        layout = "us,ara";
        variant = "qwerty";
        model = "pc105";
        options = "grp:win_space_toggle";
      };
    };
    displayManager = {
      defaultSession = "none+bspwm";
      autoLogin = {
        enable = true;
        user = "ab0z3in4";
      };
    };
  };

  # System Drivers
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ vaapiIntel vpl-gpu-rt intel-media-driver intel-compute-runtime mesa ];
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:14:0:0";
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
  programs.zsh.enable = true;
  users.users.ab0z3in4 = {
    isNormalUser = true;
    initialPassword = "password";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "libvirtd" "kvm" ];
  };

  environment.sessionVariables = rec {
    GTK_THEME="adw-gtk3-dark";
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    git
    unzip
    unrar
    efibootmgr
    grub2
    ntfs3g
    brightnessctl
    neovim
    nodejs
    python3
    gcc
    wget
    htop
    neofetch
    brave
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
    copyq
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
    thefuck
    xdg-desktop-portal-gtk
    gnome-keyring
    adwaita-qt
    adw-gtk3
    bibata-cursors
    papirus-icon-theme
    telegram-desktop
    zapzap
    onlyoffice-desktopeditors
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "alacritty";
  };

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
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

  # Virtualisation
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  programs.virt-manager.enable = true;

  # ZRAM SWAP
  zramSwap = {
    enable = true;
    algorithm = "lz4";
    memoryPercent = 50;
    priority = 999;
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  security.polkit.enable = true;
  security.apparmor.enable = true;

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
