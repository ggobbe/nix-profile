# global flake.nix
# nix profile install .
# nix profile upgrade nix-ggobbe
# nix profile remove nix-ggobbe
# rm flake.lock

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
          gitui
          lazygit
          tig
          readline
          watch
          tree
          # fish
          chezmoi
          pstree
          sapling
          jujutsu
          lazyjj

          # dev tools
          kubectl
          kubectx
          #lima
          protobuf
          buf
          #buf-language-server
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
          neovim
          #monolith
          just
          sqlite
          cmake
          ninja
          ccache
          # vscode-langservers-extracted  # eslint format in helix
          # podman
          # rabbitmq-server
          graphviz

          # infrastructure
          k9s

          # programming environments
          erlang_27
          rebar3

          # others
          yt-dlp
          exercism
          taskwarrior
        ];
      };
  };
}
