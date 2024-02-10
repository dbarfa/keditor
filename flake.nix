{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat.url = "github:edolstra/flake-compat";
    flake-compat.flake = false;
  };

  outputs = inputs@{ self, flake-utils, nixpkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.pkgsStatic.mkShell {
          nativeBuildInputs = with pkgs; [
            # cross compiler for c
            zig

            # lsp
            bear
            clang-tools
            ccls
          ];
          buildInputs = with pkgs.pkgsStatic; [ stdenv.cc.libc ];
        };
      });
}
