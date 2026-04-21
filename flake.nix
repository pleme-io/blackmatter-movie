{
  description = "Blackmatter Movie — AI video production MCP infrastructure";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = {
      url = "github:pleme-io/substrate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, substrate, ... }:
    (import "${substrate}/lib/blackmatter-component-flake.nix") {
      inherit self nixpkgs;
      name = "blackmatter-movie";
      description = "AI video production MCP servers (ElevenLabs, Runway, DaVinci, etc.)";
      modules.homeManager = import ./module {
        skillHelpers = import "${substrate}/lib/hm/skill-helpers.nix" { lib = nixpkgs.lib; };
      };
    };
}
