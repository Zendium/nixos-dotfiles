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
    	        font-family: "Monospace";
    	      }
    	'';
	};
}
