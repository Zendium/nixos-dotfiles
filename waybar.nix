{ config, pkgs, ... }:

{
	programs.waybar = {
		enable = true;
		settings = {
    		mainBar = {
      			layer = "top";
    			modules-left  = [ "niri/workspaces" "niri/window" ];
    			modules-right = [ "wireplumber" "network" "cpu" "clock" ];
			 };
    	};
    	style = ''
    	  * {
    	  	font-family: "Monospace", "Symbols Nerd Font";
    	  	font-size: 12px;
    	  }
    	  
    	  window#waybar {
    	  	background-color: transparent;
    	  	color: #cad3f5;
    	  }
    	  
    	  #workspaces button,
    	  #clock,
    	  #cpu,
    	  #network,
    	  #wireplumber {
    	  	padding: 0 8px;
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
