{
  description = "zendih NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
    	url = "github:nix-community/home-manager/release-25.11";
    	inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
    	url = "github:sodiboo/niri-flake";
    	inputs.nixpkgs.follows = "nixpkgs";
    };
    silentSDDM = {
    	url = "github:uiriansan/SilentSDDM";
    	inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
        url = "github:nix-community/stylix/release-25.11";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, niri, stylix, ... }: {
    nixosConfigurations = {
      "mummokone" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./mummokone_configuration.nix
          niri.nixosModules.niri
          
          home-manager.nixosModules.home-manager
		  {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
			home-manager.backupFileExtension = "hm-backup";
            home-manager.users.zendih = {
            	imports = [
		          	./niri.nix
					./home.nix
            	];
            };
          }
        ];
      };
      "slabi" = nixpkgs.lib.nixosSystem {
      	system = "x86_64-linux";
      	specialArgs = { inherit inputs; };
      	modules = [
      		stylix.nixosModules.stylix
      		./stylix.nix
      		./default_configuration.nix
      		./slabi_hardware-configuration.nix
      		niri.nixosModules.niri
      		home-manager.nixosModules.home-manager
      		{
      			home-manager.useGlobalPkgs = true;
      			home-manager.useUserPackages = true;
      			home-manager.backupFileExtension = "hm-backup";
      			home-manager.users.zendih = {
      				imports = [
      					./niri.nix
      					./home.nix	
      				];
      			};
      		}
      	];
      };
    };
  };
}
