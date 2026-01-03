{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    qtile = "qtile";
    nvim = "nvim";
    alacritty = "alacritty";
    rofi = "rofi";
    niri = "niri";
    noctalia = "noctalia";
  };
in


{
  home.username = "hxt";
  home.homeDirectory = "/home/hxt";
  programs.git.enable = true;
  home.stateVersion = "25.05";

  imports = [
    ./core.nix
    ./pkgs.nix
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      v = "nvim";
      btw = "echo I use nixos, btw";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;
}
