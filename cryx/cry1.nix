
rec {
  hutil = rec {
    files_to_named_attr_list = post_import: files: builtins.map (
      file: {
        name = builtins.elemAt (
          builtins.match "([[:alnum:]_]+).nix" (builtins.baseNameOf file)
        ) 0;
        value = post_import (import file);
      }
    ) files;

    # files_to_named_attr = files: builtins.listToAttrs (
    #   builtins.map (
    #     file: {
    #       name = builtins.elemAt (
    #         builtins.match "([[:alnum:]_]+).nix" (builtins.baseNameOf file)
    #       ) 0;
    #       value = import file;
    #     }
    #   )
    # );

    # deep_attr_merge = attr1: attr2: null;

    attr_list_to_attr = attr_mutation: attr_list: builtins.foldl' (
      acc: set: acc // (attr_mutation set)
    ) {} attr_list;

    # unname_named_attr = attr: attr_list_to_attr (a: a) (builtins.attrValues attr);

    files_to_attr = post_import: files: attr_list_to_attr (a: a.value) (files_to_named_attr_list post_import files);

    # himport = args: files: files_to_attr (a: a args) files;
  };

  # dem2 = hutil.files_to_named_attr (a: a) [
  #   ./demo.nix
  #   ./demo2.nix
  # ];
  # dem3 = hutil.unname_named_attr dem2;
  # dem4 = hutil.files_to_attr (a: a) [
  #   ./demo.nix
  #   ./demo2.nix
  # ];
  # dem5 = hutil.himport 4 [
  #   ./hdem1.nix
  #   ./hdem2.nix
  # ];
  dem6 = builtins.listToAttrs (hutil.files_to_named_attr_list (a: a) [
    ./demo.nix
    ./demo2.nix
  ]);
}