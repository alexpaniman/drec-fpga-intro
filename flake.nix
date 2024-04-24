{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
      };
    in
  {

    devShells.x86_64-linux = {
      default = pkgs.mkShell {
        buildInputs = [
          pkgs.verilog
          pkgs.gtkwave
          pkgs.riffdiff
          pkgs.meld
        ];
      };
    };

  };
}
