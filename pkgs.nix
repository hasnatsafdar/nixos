{ pkgs, ... }: {

  home.packages = with pkgs; [
    noctalia-shell
    thunar
    kanata
    nitch
    eza
    btop
    fzf
    mpv
    tealdeer
    uv
    yazi
    poppins
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    rofi
    lxappearance
  ];
}
