
rec {
  hutil = rec {

    attr_list_to_attr = attr_list: builtins.zipAttrsWith (
      name: values:
        # attr + attr -> recursive this
        if (builtins.all builtins.isAttrs values) then ( 
          attr_list_to_attr values
        ) else
        # list + list -> concat
        if (builtins.all builtins.isList values) then (
          builtins.concatLists values
        ) else
        if (builtins.length values) == 1 then (
          builtins.head values
        ) else
        # error
          throw "CRYNIX: Cannot merge: ${values}"
    ) attr_list;

    files_to_named_attr_list = post_import: files: builtins.map (
      file: {
        name = builtins.elemAt (
          builtins.match "([[:alnum:]_]+).nix" (builtins.baseNameOf file)
        ) 0;
        value = post_import (import file);
      }
    ) files;

    named_attr_to_attr = named_attr: attr_list_to_attr (builtins.attrValues named_attr);

    himport_mut = post_import: files:
      attr_list_to_attr
      (
        builtins.map
        (named_attr: named_attr.value)
        (files_to_named_attr_list post_import files)
      )
    ;

    himport = args: files:
      himport_mut (fn: fn args) files;

    fimport_mut = post_import: files:
      builtins.listToAttrs
        (files_to_named_attr_list post_import files)
    ;

    fimport = args: files:
      fimport_mut (fn: fn args) files;

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
  # dem8 = hutil.fimport 5 [
  #   ./hdem1.nix
  #   ./hdem2.nix
  # ];
  dem9 = hutil.himport 1 [
    ./hdem1.nix
    ./hdem2.nix
  ];
}