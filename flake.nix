{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system: let
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in {
      packages.cosmovisor_1_7_1 = pkgs.buildGoModule rec {
        pname = "cosmovisor";
        subPackages = "cmd/cosmovisor";
        vendorHash = "sha256-DXgFvjm1fDHtDwPNfLIPi2vMdZTi3bYN7cgR1dgdgLk=";
        version = "1.7.1";
        modRoot = "tools/cosmovisor";
        src = pkgs.fetchurl {
          hash = "sha256-EcCunjFcc9irVwDbIkn/mauUbpgorXOX82bxnodkBI8=";
          url = "https://github.com/cosmos/cosmos-sdk/archive/refs/tags/cosmovisor/v${version}.tar.gz";
        };
      };
    });
}
