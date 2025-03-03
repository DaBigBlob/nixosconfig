# { lib, ... }:

# {
#   options = {
#     config.gui = lib.mkOption {
#       type = lib.types.bool;
#       default = true;
#     };
#   };

#   config.gui = lib.mkDefault true;
# }