
rec {
# hutil is 882 bytes
hutil = rec{attr_list_to_attr=attr_list: builtins.zipAttrsWith(name: values: if(builtins.length values)==1 then(builtins.head values)else if(builtins.all builtins.isAttrs values)then(attr_list_to_attr values)else if(builtins.all builtins.isList values)then(builtins.concatLists values)else builtins.throw"hutil: Cannot merge: [${builtins.toString values}]")attr_list;files_to_attr_list=post_import: files: builtins.map(file: builtins.listToAttrs[{name=builtins.head(builtins.match"([[:alnum:]_]+).nix"(builtins.baseNameOf file));value=post_import(builtins.import file);}])files;himport_mut=post_import: files: attr_list_to_attr(builtins.map(file: post_import(builtins.import file))files);fimport_mut=post_import: files: attr_list_to_attr(files_to_attr_list post_import files);himport=args: files: himport_mut(fn: fn args)files;fimport=args: files: fimport_mut(fn: fn args)files;};
dem8 = hutil.fimport 3 [
    ./hdem1.nix
    ./hdem2.nix
  ];
  dem9 = hutil.himport 3 [
    ./hdem1.nix
    ./hdem2.nix
  ];
}