files:
builtins.listToAttrs (
  builtins.map
    (file: {
      name = builtins.elemAt
        (builtins.match
          "([[:alnum:]_]+).nix"
          (builtins.baseNameOf file)
        )
        0;
      value = import file;
    })
    files
)