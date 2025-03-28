{ lib, ... }:

{
  options = {
    gui = lib.mkOption {
      type = lib.types.bool;
    };

    mobile = lib.mkOption {
      type = lib.types.bool;
    };
    
  };
}