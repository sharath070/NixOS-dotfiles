{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # inputs.nix-colors.homeManagerModules.default
  ];

  # colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sharath";
  home.homeDirectory = "/home/sharath";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    starship
    lua-language-server
    stylua
    gopls
    gotools
    gofumpt
    gomodifytags
    air
    sqlc
    goose
    typescript-language-server
    # svelte-language-server
    tailwindcss-language-server
    prettierd
    eslint_d
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/sharath/etc/profile.d/hm-session-vars.sh
  #

  programs.git = {
    enable = true;
    userName = "sharath";
    userEmail = "sharathkota070@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    NIXOS_OZONE_WL = "1"; # For Wayland support
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    MOZ_ENABLE_WAYLAND = "1";
    TERMINAL = "ghostty";
  };

  # gtk = {
  #   enable = true;
  #   theme = {
  #     name = "Tokyonight-Dark";
  #     package = pkgs.tokyonight-gtk-theme;
  #   };
  #   iconTheme = {
  #     name = "kora";
  #     package = pkgs.kora-icon-theme;
  #   };
  #   cursorTheme = {
  #     name = "Bibata-Modern-Classic";
  #     package = pkgs.bibata-cursors;
  #   };
  # };

  # qt = {
  #   enable = true;
  #   platformTheme.name = "gtk";
  #   style = {
  #     name = "gtk2";
  #   };
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
