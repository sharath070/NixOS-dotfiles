{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "sharath";
    userEmail = "sharath070@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
