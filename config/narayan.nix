{ pkgs, ...}:

{
  users.users.narayan = {
    isNormalUser = true;
    description = "Narayan";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBhgcC+53QIoD9wmc0ziGtCfyivh7lDb65E5ADCP5Bcv narayan@nav"
     ];
   };
}
