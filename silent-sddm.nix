{
  pkgs,
  inputs,
  config,
  ...
}: let

	localBg = pkgs.runCommand "anim_bg_placeholder.mp4" { } ''
		cat ${./wallpapers/anim_bg_placeholder.mp4} > $out
		chmod 0644 $out
	'';

	localBgImage = pkgs.runCommand "anim_bg_placeholder_image.png" { } ''
		cat ${./wallpapers/anim_bg_placeholder_image.png} > $out
		chmod 0644 $out
	'';
	
	sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
		theme = "rei";
		extraBackgrounds = [ localBg localBgImage ];
		theme-overrides = {
			"General" = {
				animated-background-placeholder = "anim_bg_placeholder_image.png";
			};
      		"LoginScreen" = {
 	     		 background = "anim_bg_placeholder.mp4";
      		 };
     		"LockScreen"  = {
     			background = "anim_bg_placeholder.mp4";
     		};
     		"LockScreen.Clock" = {
   				font-family = "Oxanium";
   			};
   			"LockScreen.Date" = {
   				font-family = "Oxanium";
   			};
   			"LockScreen.Message" = {
   				font-family = "Oxanium";
   			};
   			
		};
	};
	
in  {
   environment.systemPackages = [sddm-theme sddm-theme.test];
   qt.enable = true;
   services.displayManager.sddm = {
      package = pkgs.kdePackages.sddm;
      enable = true;
      wayland.enable = true;
      theme = sddm-theme.pname;
      # the following changes will require sddm to be restarted to take
      # effect correctly. It is recomend to reboot after this
      extraPackages = sddm-theme.propagatedBuildInputs;
      settings = {
        # required for styling the virtual keyboard
        General = {
          GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";
          InputMethod = "qtvirtualkeyboard";
        };
      };
   };
}
