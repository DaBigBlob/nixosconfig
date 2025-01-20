
# hard pin channels
# also make channels reproducible

# nix eval --expr "(import ./utils/channels.nix)" --extra-experimental-features nix-command --impure
# for hash etc check

{
    nixos-hardware = builtins.fetchTarball {
        url = "https://github.com/NixOS/nixos-hardware/archive/b678606690027913f3434dea3864e712b862dde5.tar.gz";
        sha256 = "1y9hgi4c35d1x2kgdw1x2l2hyqdiy48yiwfg4g1p7w8ha8yzgjm0";
    };

    home-manager = builtins.fetchTarball {
        url = "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
        sha256 = "15k41il0mvmwyv6jns4z8k6khhmb22jk5gpcqs1paym3l01g6abn";
    };
}