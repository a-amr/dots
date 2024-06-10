#if you want to pass on the flake inputs to external configuration files, you can use the specialArgs attribute:

{
 description = "Nixos config flake first one ";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;


    nixpkgs-stable.url = github:nixos/nixpkgs/nixos-23.11;

###       home-manager = {
###         url = "github:nix-community/home-manager";
###         inputs.nixpkgs.follows = "nixpkgs";
###       };
###   
###         hyprland = {
###           url = "github:hyprwm/Hyprland";
###           #url = "https://github.com/hyprwm/Hyprland/releases/download/v0.36.0/v0.36.0.tar.gz";
###           #type = "github";
###           #owner = "hyprpm";
###           #repo = "Hyprland";
###            
###            inputs.nixpkgs.follows = "nixpkgs";
###   
###       };
###   #      hyprgrass = {
###   ##         url = "github:horriblename/hyprgrass";
###   #         type = "github";
###   #         owner = "horriblename";
###   #         repo = "hyprgrass";
###   #         #rev = "bbaa70e8c71e451c2099bf9fa99241fbf1183eea";
###   #         inputs.hyprland.follows = "hyprland"; # IMPORTANT
###   #   };
###      hyprland-plugins = {
###       url = "github:hyprwm/hyprland-plugins";
###       inputs.hyprland.follows = "hyprland";
###     };
   };
   #outputs = { self,nixpkgs-stable, nixpkgs,home-manager,hyprland, ... }@inputs:
   outputs = { self,nixpkgs-stable, nixpkgs, ... }@inputs:
   let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in
      {

  #  homeConfigurations."ababa@xxx" = home-manager.lib.homeManagerConfiguration {
  #    modules = [
  #     hyprland.homeManagerModules.default
  #      {wayland.windowManager.hyprland.enable = true;}
  #    ];
  #    };
    nixosConfigurations.xxx= nixpkgs.lib.nixosSystem {
    specialArgs = {
     inherit inputs;





      # The `specialArgs` parameter passes the
        # non-default nixpkgs instances to other nix modules
          # To use packages from nixpkgs-stable,
          # we configure some parameters for it first
          pkgs-stable = import nixpkgs-stable {
            # Refer to the `system` parameter from
            # the outer scope recursively
            inherit system;
            # To use Chrome, we need to allow the
            # installation of non-free software.
          };


     };
        system = "x86_64-linux";  # Adjust for your system architecture
        modules =[ ./configuration.nix 
#      inputs.home-manager.nixosModules.default
      ];
    };
  };
}
