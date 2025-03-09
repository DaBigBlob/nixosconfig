
{ pkgs, ... }:

{
    boot = {
        kernelPackages = pkgs.unstable.linuxKernel.packages.linux_6_13;
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
        # kernelParams = [
        #   "fbcon=font:TER16x32"
        # ];
    };

    services.fwupd.enable = true; # firmware update

    environment.etc."issue".text = ''
      ------               _____      
     /      \\ ___\\     ___/    ___    
  --/-  ___  /    \\/  /  /    /   \\   
 /     /           \\__     //_     \\  
/                     \\   / ___     | 
|           ___       \\/+--/        / 
 \\__           \\       \\           /  
    \\__                 |          /  
   \\     /____      /  /       |   /  
    _____/         ___       \\/  /\\   
         \\__      /      /    |    |  
       /    \\____/   \\       /   //   
   // / / // / /\\    /-_-/\\//-__-     
    /  /  // /   \\__// / / /  //      
 /there are tears in the sky,/ /      
    /// // / /   /  //  / //          
 //   //  where the rain gets in,     
   / / / / /     /  /    /            
you're getting drenched,//            
   ///    /    /    / / / /           
/  /  // '';

}