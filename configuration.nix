# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  pkgs-stable,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = false;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.displayManager.sddm.enable = false;

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  # programs.zsh.enable = true;
  # users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sharath = {
    isNormalUser = true;
    description = "Sharath";
    extraGroups = ["networkmanager" "wheel"];
    packages =
      (with pkgs; [
        go
        vscode-fhs
        nodejs
        ghostty
        tmux
        lazygit
        unzip
        lsd
        tealdeer
        hurl
        jq
        fzf
        nwg-look
        rofi-wayland
        waybar
        mpv
        hyprlock
        hyprshot
        swww
        wl-clipboard
        cliphist
        wl-clip-persist
        swaynotificationcenter
        fastfetch
        wf-recorder
        nerdfetch
        ffmpeg
        qbittorrent
        yazi
        gedit
        networkmanagerapplet
        brightnessctl
        kooha
        stow
        pavucontrol
        rsclock
        btop
        cava
        pipes
        wlogout
        htop
        mediawriter
        brave
        inputs.zen-browser.packages."${system}".default
      ])
      ++ (with pkgs-stable; [
        ]);
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    (with pkgs; [
      wget
      git
      gnumake
      gcc
      neovim
      nixd
      alejandra
      home-manager
      ripgrep
      xdg-user-dirs
    ])
    ++ (with pkgs-stable; [
      ]);

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql;
  };

  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  security.polkit.enable = true;
  systemd = {
    user.services.polkit-mate-authentication-agent-1 = {
      description = "polkit-mate-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  fonts.packages = with pkgs-stable; [
    nerdfonts
  ];

  programs.hyprland.enable = true;

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;
  };

  # kanata config
  # Enable the uinput module
  boot.kernelModules = ["uinput"];

  # Enable uinput
  hardware.uinput.enable = true;

  # Set up udev rules for uinput
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  # Ensure the uinput group exists
  users.groups.uinput = {};

  # Add the Kanata service user to necessary groups
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          # Replace the paths below with the appropriate device paths for your setup.
          # Use `ls /dev/input/by-path/` to find your keyboard devices.
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usb-0:1:1.0-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
            caps tab
            ; '
            lalt
          )

          (defvar
            tap-time 200
            hold-time 200
          )

          (defalias
            caps-mod (tap-hold $tap-time $hold-time lctl lctl)
            tab-mod (tap-hold $tap-time $hold-time tab lmet)
            ;-mod (tap-hold $tap-time $hold-time ; rmet)
            '-mod (tap-hold $tap-time $hold-time ' rctl)
            lalt-mod (tap-hold $tap-time $hold-time caps lalt)
          )

          (deflayer base
            @caps-mod @tab-mod
            @;-mod @'-mod
            @lalt-mod
          )
        '';
      };
    };
  };


  fileSystems."/home/sharath/.drive" = {
    device = "/dev/disk/by-uuid/103b5514-438a-44e3-8e50-9c230f8d496d";
    fsType = "ext4";
    options = [ "defaults" ];
  };

  networking = {
    hostName = "nixos"; # feel free to change it
    networkmanager.enable = true;
    wireless.enable = false; # because we use NetworkManager for wifi
    networkmanager.wifi.backend = "wpa_supplicant";
    # firewall.allowedTCPPorts = [ 5900 ];  # optional - only if you need to open a port
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
