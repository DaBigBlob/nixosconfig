
# hard pin channels
# also make channels reproducible

# nix eval --expr "(import ./srcs/channels.nix)" --extra-experimental-features nix-command --impure
# for hash etc check

# usage in imports eg.:
#   (import "${(import ../srsc/channels.nix).nixos-hardware}/framework/13-inch/7040-amd")

{
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/5ef6c425980847c78a80d759abc476e941a9bf42.tar.gz";
    sha256 = "11r8w8p36183cvk8vjg9w8mghgj4spwpb5n6jw31g3vzi0c2ykc7";
  };

  nixpkgs-unstable = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/26c186cbd208bb6f980d2bad84cd92057425d9f0.tar.gz";
    sha256 = "1j60yxabnl97xmz2cjgykr8j3mngkq10dn8492s60wshjpx91xvd";
  };

  nixos-hardware = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixos-hardware/archive/cbefe8bde7399864cb100f9dc115edd818cbab3b.tar.gz";
    sha256 = "1n4qcmcmsd9g3g01dhr4351z3jcx3a0k0yfmmjya6b6al4q2qzzq";
  };

  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/9d3d080aec2a35e05a15cedd281c2384767c2cfe.tar.gz";
    sha256 = "0c07xj74vsj37d3a8f98i9rhhhr99ckwlp45n40f0qkmigm3pk8s";
  };

  agenix = builtins.fetchTarball {
    url = "https://github.com/ryantm/agenix/archive/e600439ec4c273cf11e06fe4d9d906fb98fa097c.tar.gz";
    sha256 = "006ngydiykjgqs85cl19h9klq8kaqm5zs0ng51dnwy7nzgqxzsdr";
  };
}