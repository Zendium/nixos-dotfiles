{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        modules-left = [
          "niri/workspaces"
          "niri/window"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "memory"
          "cpu"
          "wireplumber"
          "network"
          "battery"
        ];

        "window" = {
          truncate = 30;
        };
        "wireplumber" = {
          interval = 1;
          format = "{icon} {volume}%";
          format-muted = "󰝟";
          format-icons = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
        };
        "battery" = {
          interval = 10;
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          format = "{icon} {capacity}%";
        };
        "network" = {
          interval = 10;
          format-ethernet = "󰈁 {ifname} 󰕒 {bandwidthUpBits} 󰇚 {bandwidthDownBits}";
          format-wifi = "󰖩 {essid} {signalStrength}% 󰕒 {bandwidthUpBits} 󰇚 {bandwidthDownBits}";
          format-disconnected = "󰖪 disconnected";
        };
        "cpu" = {
          format = " {usage}%";
        };
        "memory" = {
          "format" = " {used:0.1f}G";
          "interval" = 5;
        };

      };

    };
    style = ''
      	  * {
      	  	font-family: "Monospace", "Symbols Nerd Font";
      	  	font-size: 12px;
      	  }
      	  
      	  window#waybar {
      	  	background-color: transparent;
      	  	color: #cdd6f4;
      	  }
      	  
      	  #workspaces button,
      	  #clock,
      	  #cpu,
      	  #window,
      	  #network,
      	  #memory,
      	  #battery,
      	  #wireplumber {
      	  	padding: 0 8px;
      	  }

      	  #clock {
      	  	font-weight: bold;
      	  	text-shadow: 0.5px 0 currentColor;
      	  }
      	  
      	  #workspaces button {
      	  	color: #cad3f5;
      	  }
      	  
      	  #workspaces button.active {
      	  	border-radius: 0;
      	  	border-bottom: 1px solid #a6da95;
      	  }
      	  
      	'';
  };
}
