{ config, pkgs, ... }:
let
	terminal = "kitty";
	
in
{
  config = {
	  programs.niri = {
	    settings = {
			environment = {
			    NIXOS_OZONE_WL = "1";
			    XDG_CURRENT_DESKTOP = "niri";
			    #WLR_BACKEND = "vulkan";
			
			    MOZ_ENABLE_WAYLAND = "1";
			    QT_QPA_PLATFORM = "wayland";
			    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
			    CLUTTER_BACKEND = "wayland";
			    GDK_BACKEND = "wayland";
			};
			prefer-no-csd = true;
			input = {
				keyboard.xkb.layout = "fi";
				warp-mouse-to-focus.enable = true;
			};
			cursor.hide-when-typing = true;
			layout = {
				gaps = 5;
				focus-ring = {
					enable = false;
				};
				border = {
					enable = true;
					width = 2;
					active.color = "#7fc8ff";
					inactive.color = "#505050";
					urgent.color = "#9b0000";
				};
				background-color = "transparent";
			};
			hotkey-overlay.skip-at-startup = false;
			screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
			window-rules = [
				{
					geometry-corner-radius = {
				    	top-left     = 5.0;
				    	top-right    = 5.0;
				    	bottom-left  = 5.0;
				    	bottom-right = 5.0;
				    };
					clip-to-geometry = true;
				}
				
			];
			spawn-at-startup = [
				{ argv = ["waybar"]; }
			];
			binds = {
			  "Super+Shift+H".action.show-hotkey-overlay = [];
			
			  "Mod+Return".action.spawn = [terminal];
			  "Mod+D".action.spawn = ["fuzzel"];
			  "Super+Shift+L".action.spawn = ["swaylock"];
			
			  "XF86AudioRaiseVolume".action.spawn-sh = ["swayosd-client --output-volume=+2"];
			  "XF86AudioLowerVolume".action.spawn-sh = ["swayosd-client --output-volume=-2"];
			  "XF86AudioMute".action.spawn-sh = ["swayosd-client --output-volume=mute-toggle"];
			  "XF86AudioMicMute".action.spawn-sh = ["swayosd-client --input-volume=mute-toggle"];
			
			  "XF86AudioPlay".action.spawn-sh = ["swayosd-client --playerctl=play"];
			  "XF86AudioStop".action.spawn-sh = ["swayosd-client --playerctl=stop"];
			  "XF86AudioPrev".action.spawn-sh = ["swayosd-client --playerctl=prev"];
			  "XF86AudioNext".action.spawn-sh = ["swayosd-client --playerctl=next"];
			
			  "XF86MonBrightnessUp".action.spawn-sh = ["swayosd-client --brightness=+5"];
			  "XF86MonBrightnessDown".action.spawn-sh = ["swayosd-client --brightness=-5"];
			
			  "Mod+O" = {
			    repeat = false;
			    action.toggle-overview = [];
			  };
			
			  "Mod+Shift+Q".action.close-window = [];
			
			  "Mod+Left".action.focus-column-left = [];
			  "Mod+Down".action.focus-window-down = [];
			  "Mod+Up".action.focus-window-up = [];
			  "Mod+Right".action.focus-column-right = [];
			
			  "Mod+Ctrl+Left".action.move-column-left = [];
			  "Mod+Ctrl+Down".action.move-window-down = [];
			  "Mod+Ctrl+Up".action.move-window-up = [];
			  "Mod+Ctrl+Right".action.move-column-right = [];
			
			  "Mod+Home".action.focus-column-first = [];
			  "Mod+End".action.focus-column-last = [];
			  "Mod+Shift+Home".action.move-column-to-first = [];
			  "Mod+Shift+End".action.move-column-to-last = [];
			
			  "Mod+Ctrl+Shift+Left".action.focus-monitor-left = [];
			  "Mod+Ctrl+Shift+Down".action.focus-monitor-down = [];
			  "Mod+Ctrl+Shift+Up".action.focus-monitor-up = [];
			  "Mod+Ctrl+Shift+Right".action.focus-monitor-right = [];
			
			  "Mod+Shift+Ctrl+Alt+Left".action.move-column-to-monitor-left = [];
			  "Mod+Shift+Ctrl+Alt+Down".action.move-column-to-monitor-down = [];
			  "Mod+Shift+Ctrl+Alt+Up".action.move-column-to-monitor-up = [];
			  "Mod+Shift+Ctrl+Alt+Right".action.move-column-to-monitor-right = [];
			
			  "Mod+Page_Down".action.focus-workspace-down = [];
			  "Mod+Page_Up".action.focus-workspace-up = [];
			  "Mod+U".action.focus-workspace-down = [];
			  "Mod+I".action.focus-workspace-up = [];
			  "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = [];
			  "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = [];
			  "Mod+Ctrl+U".action.move-column-to-workspace-down = [];
			  "Mod+Ctrl+I".action.move-column-to-workspace-up = [];
			
			  "Mod+Shift+Page_Down".action.move-workspace-down = [];
			  "Mod+Shift+Page_Up".action.move-workspace-up = [];
			  "Mod+Shift+U".action.move-workspace-down = [];
			  "Mod+Shift+I".action.move-workspace-up = [];
			
			  "Mod+WheelScrollDown".action.focus-workspace-down = [];
			  "Mod+WheelScrollUp".action.focus-workspace-up = [];
			  "Mod+Ctrl+WheelScrollDown".action.move-column-to-workspace-down = [];
			  "Mod+Ctrl+WheelScrollUp".action.move-column-to-workspace-up = [];
			
			  "Mod+WheelScrollRight".action.focus-column-right = [];
			  "Mod+WheelScrollLeft".action.focus-column-left = [];
			  "Mod+Ctrl+WheelScrollRight".action.move-column-right = [];
			  "Mod+Ctrl+WheelScrollLeft".action.move-column-left = [];
			
			  "Mod+Shift+WheelScrollDown".action.focus-column-right = [];
			  "Mod+Shift+WheelScrollUp".action.focus-column-left = [];
			  "Mod+Ctrl+Shift+WheelScrollDown".action.move-column-right = [];
			  "Mod+Ctrl+Shift+WheelScrollUp".action.move-column-left = [];
			
			  "Mod+1".action.focus-workspace = [1];
			  "Mod+2".action.focus-workspace = [2];
			  "Mod+3".action.focus-workspace = [3];
			  "Mod+4".action.focus-workspace = [4];
			  "Mod+5".action.focus-workspace = [5];
			  "Mod+6".action.focus-workspace = [6];
			  "Mod+7".action.focus-workspace = [7];
			  "Mod+8".action.focus-workspace = [8];
			  "Mod+9".action.focus-workspace = [9];
			  "Mod+Shift+1".action.move-column-to-workspace = [1];
			  "Mod+Shift+2".action.move-column-to-workspace = [2];
			  "Mod+Shift+3".action.move-column-to-workspace = [3];
			  "Mod+Shift+4".action.move-column-to-workspace = [4];
			  "Mod+Shift+5".action.move-column-to-workspace = [5];
			  "Mod+Shift+6".action.move-column-to-workspace = [6];
			  "Mod+Shift+7".action.move-column-to-workspace = [7];
			  "Mod+Shift+8".action.move-column-to-workspace = [8];
			  "Mod+Shift+9".action.move-column-to-workspace = [9];
			
			  "Mod+Alt+Left".action.consume-or-expel-window-left = [];
			  "Mod+Alt+Right".action.consume-or-expel-window-right = [];
			
			  "Mod+Ctrl+R".action.reset-window-height = [];
			  "Mod+F".action.maximize-column = [];
			  "Mod+Shift+F".action.fullscreen-window = [];
			  "Mod+Ctrl+F".action.expand-column-to-available-width = [];
			  "Mod+C".action.center-column = [];
			  "Mod+Ctrl+C".action.center-visible-columns = [];
			
			  "Mod+Shift+Left".action.set-column-width = "-5%";
			  "Mod+Shift+Right".action.set-column-width = "+5%";
			  "Mod+Shift+Up".action.set-window-height = "-5%";
			  "Mod+Shift+Down".action.set-window-height = "+5%";
			
			  "Mod+V".action.toggle-window-floating = [];
			  "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = [];
			
			  "Mod+W".action.toggle-column-tabbed-display = [];
			
			  "Print".action.screenshot = [];
			  "Ctrl+Print".action.screenshot-screen = [];
			  "Alt+Print".action.screenshot-window = [];
			  "Mod+Shift+S".action.screenshot = [];
			
			  "Mod+Escape".action.toggle-keyboard-shortcuts-inhibit = [];
			
			  "Mod+Shift+E".action.quit = [];
			  "Ctrl+Alt+Delete".action.quit = [];
			
			  "Mod+Shift+P".action.power-off-monitors = [];
			};
	    };
	  };
  };
}
