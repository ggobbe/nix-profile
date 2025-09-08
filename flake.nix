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
          curl
          wget
          jq
#         gnused
#         ripgrep
          zellij
          pandoc
          helix
          btop
          jq
          openssl
          yazi
          gitui
          lazygit
          tig
          watch
          tree
          chezmoi
#         jujutsu
#          lazyjj
#          watchexec
          less
          nmap

          # dev tools
          kubectl
          kubectx
          protobuf
          buf
          clang-tools
          mongodb-tools
          dive
          mise
          flyctl
          neovim
          # podman

          # infrastructure
          k9s

          # programming environments
          erlang_27
          rebar3

          # others
          yt-dlp
        #exercism
        ];
      };
  };
}
