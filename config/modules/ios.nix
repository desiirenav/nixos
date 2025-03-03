{config,lib,pkgs,pkgs-unstable,inputs,...}:
{
  services.usbmuxd.enable = true;

  environment.systemPackages = with pkgs; [
    libimobiledevice
    ifuse # optional, to mount using 'ifuse'
  ];
}
