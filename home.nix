{ config, pkgs, ... }:

{
  imports = [
  	./waybar.nix
  ];
  home.username      = "zendih";
  home.homeDirectory = "/home/zendih";

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
	gotop
	ffmpeg
	aseprite
	vlc
	gimp
  	telegram-desktop
 	fuzzel
  	kitty
  ];

  services.swayosd = {
  	enable = true;
	stylePath = ./styles/swayosd.css;
  };
  programs.swaylock = {
  	enable = true;
  	settings = {
  		color = "#000000";
  		indicator-radius = 10;
  		indicator-thickness = 15;
  		layout-text-color = "#00000000";
  	};
  };

  programs.zsh.enable = true;
}
