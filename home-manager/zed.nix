{
  config,
  pkgs,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "git-firefly"
      "html"
    ];

    ## everything inside of these brackets are Zed options.
    userSettings = {
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      hour_format = "hour12";
      auto_update = false;
      terminal = {
        shell = "system";
      };

      languages = {
        Nix = {
          language_servers = ["nil" "!nixd"];
          formatter = {external = {command = "alejandra";};};
        };
      };

      lsp = {
        gopls = {
          initialization_options = {
            hints = {
              "assignVariableTypes" = true;
              "compositeLiteralFields" = true;
              "compositeLiteralTypes" = true;
              "constantValues" = true;
              "functionTypeParameters" = true;
              "parameterNames" = true;
              "rangeVariableTypes" = true;
            };
          };
        };
      };

      vim_mode = true;
      base_keymap = "VSCode";
      theme = "Andromeda";
      ui_font_size = 16;

      buffer_font_size = 14;
      format_on_save = "on";
      autosave = "on_focus_change";
    };
  };
}
