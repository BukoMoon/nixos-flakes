{
  description = "Buko NixOs Flake";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    matugen.url = "github:InioX/matugen";
    niri.url = "github:sodiboo/niri-flake";
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";
    
    sysc-greet = {
      url = "github:Nomadcxx/sysc-greet";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      #input.nixpkgs.follows = "nixpkgs";
    };
   
    nixcord = {
      url = "github:kaylorben/nixcord";
      #input.nixpkgs.follows = "nixpkgs";
    };
    
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = 
    {
      self,
      nixpkgs,
      sysc-greet,
      home-manager,
      niri,
      noctalia,
      ...
    }@inputs: 
    {
      nixosConfigurations.nixos-buko = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit self inputs; };
        modules = [
          ./hosts/default/default.nix
          #inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.default
          sysc-greet.nixosModules.default
        ];
      };
    };      
  }
