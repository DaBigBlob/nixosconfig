
{
  ragenix = (builtins.getFlake "git+https://github.com/yaxitech/ragenix?ref=main&rev=687ee92114bce9c4724376cf6b21235abe880bfa");
  nixpkgs = (builtins.getFlake "git+https://github.com/NixOS/nixpkgs?ref=nixos-24.11&rev=5ef6c425980847c78a80d759abc476e941a9bf42");
}