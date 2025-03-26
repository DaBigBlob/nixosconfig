
rec {
  files_to_attr_list = post_import: files: builtins.map (
    file: {
      name = builtins.elemAt (
        builtins.match "([[:alnum:]_]+).nix" (builtins.baseNameOf file)
      ) 0;
      value = post_import (import file);
    }
  ) files;
  files_to_named_attr = post_import: files: builtins.listToAttrs (files_to_attr_list post_import files);
  attr_list_to_attr = attr_mutation: attr_list: builtins.foldl' (acc: set: acc // (attr_mutation set)) {} attr_list;
  attr_unname_named_attr = attr: attr_list_to_attr (a: a) (builtins.attrValues attr);
  files_to_attr = post_import: files: attr_list_to_attr (a: a.value) (files_to_attr_list post_import files);
  dem2 = files_to_named_attr (a: a) [
    ./demo.nix
    ./demo2.nix
  ];
  dem3 = attr_unname_named_attr dem2;
  dem4 = files_to_attr (a: a) [
    ./demo.nix
    ./demo2.nix
  ];
}