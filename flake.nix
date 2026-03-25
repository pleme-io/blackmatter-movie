{
  description = "AI video production MCP infrastructure";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    substrate = {
      url = "github:pleme-io/substrate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, substrate, ... }: {
    homeManagerModules.default = import ./module {
      skillHelpers = import "${substrate}/lib/hm/skill-helpers.nix" { lib = nixpkgs.lib; };
    };
  };
}
