
rec {
  hutil = rec {
    # files_to_attr_list = post_import: files: builtins.map (
    #   file: post_import (import file)
    # ) files;

    attr_list_to_attr = attr_list: builtins.zipAttrsWith (
      name: values:
        if (builtins.isAttrs (builtins.elemAt values 0)) then (
          attr_list_to_attr values
        ) else
        if (builtins.isList (builtins.elemAt values 0)) then (
          builtins.concatLists values
        ) else
          builtins.elemAt values 0
    ) attr_list;

    files_to_named_attr_list = post_import: files: builtins.map (
      file: {
        name = builtins.elemAt (
          builtins.match "([[:alnum:]_]+).nix" (builtins.baseNameOf file)
        ) 0;
        value = post_import (import file);
      }
    ) files;

    named_attr_list_to_attr = attr_mutation: attr_list: builtins.foldl' (
      acc: set: acc // (attr_mutation set)
    ) {} attr_list;

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
  # dem6 = hutil.attr_list_to_attr [
  #   {a.b.c = [2];}
  #   {a.b.c = [2];}
  #   {a.f.c = 4;}
  # ];
  # dem7 = builtins.zipAttrsWith (n: v: {n=n;v=v;}) [ {a=1;} {b=2;} ];
}