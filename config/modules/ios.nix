{config,lib,pkgs,pkgs-unstable,inputs,...}:
{
  services.usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };

  environment.systemPackages = with pkgs; [
    libimobiledevice
    ifuse
  ];

  services.udev.packages = [ pkgs.libimobiledevice ];
}
