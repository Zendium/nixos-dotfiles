{ config, pkgs, ... }:

{
  imports = [
    ./waybar.nix
  ];
  home.username = "zendih";
  home.homeDirectory = "/home/zendih";

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    mpv
    qpwgraph
    gotop
    ffmpeg
    vlc
    cardinal
    gimp
    aseprite
    telegram-desktop
    signal-desktop
    fuzzel
  ];

  programs.kitty.enable = true;
  services.swayosd = {
    enable = true;
    stylePath = ./styles/swayosd.css;
  };
  programs.swaylock = {
    enable = true;
    settings = {
      indicator-radius = 10;
      indicator-thickness = 15;
    };
  };

  programs.zsh.enable = true;
}
