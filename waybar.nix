{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      modules-left  = [ "niri/workspaces" ];
      modules-right = [ "clock" ];
    };
  };
}
