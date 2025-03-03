{ lib, ... }:

{
  options = {
    gui = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  # config.gui = lib.mkDefault false;
}