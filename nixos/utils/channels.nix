
# hard pin channels
# also make channels reproducible

# nix eval --expr "(import ./utils/channels.nix)" --extra-experimental-features nix-command --impure
# for hash etc check

{
    nixos-hardware = builtins.fetchTarball {
        url = "https://github.com/NixOS/nixos-hardware/archive/cbefe8bde7399864cb100f9dc115edd818cbab3b.tar.gz";
        sha256 = "1n4qcmcmsd9g3g01dhr4351z3jcx3a0k0yfmmjya6b6al4q2qzzq";
    };

    home-manager = builtins.fetchTarball {
        url = "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
        sha256 = "15k41il0mvmwyv6jns4z8k6khhmb22jk5gpcqs1paym3l01g6abn";
    };

    # agenix = builtins.fetchTarball {
    #     url = "https://github.com/ryantm/agenix/archive/e600439ec4c273cf11e06fe4d9d906fb98fa097c.tar.gz";
    #     sha256 = "006ngydiykjgqs85cl19h9klq8kaqm5zs0ng51dnwy7nzgqxzsdr";
    # };
}