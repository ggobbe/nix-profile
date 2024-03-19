# global flake.nix

{
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs"; };

  outputs = { self, nixpkgs }: {
    formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt;
    packages."aarch64-darwin".default =
      let pkgs = nixpkgs.legacyPackages."aarch64-darwin";
      in pkgs.buildEnv {
        name = "home-packages";
        paths = with pkgs; [

          # general tools
          git
          git-lfs
          ffmpeg
          curl
          wget
          jq
          gnused
          ripgrep
          zellij
          pandoc
          helix
          aerc
          btop
          jq
          openssl
          yazi

          # dev tools
          kubectl
          kubectx
          #lima
          protobuf
          buf
          clang-tools
          yaml-language-server    # yaml in helix
          efm-langserver          # eslint in helix
          mongodb-tools
          okteto
          docker
          dive
          #biome
          #android-tools
          mise
          flyctl

          # infrastructure
          k9s

          # programming environments
          deno
          #bun
          #nodejs_20
          #yarn
          #corepack_20
          #go
          erlang_26
          rebar3
          #elixir_1_16
          #elixir-ls
          #gleam
        ];
      };
  };
}
