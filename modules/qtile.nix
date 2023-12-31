{ config, pkgs, lib, ... }:

{

services = {
  acpid.enable = true;
  devmon.enable = true;
  printing.enable = true;
  udev = {
    packages = [ pkgs.libmtp ];
  };
  udisks2.enable = true;

  xserver = {
    enable = true;
    libinput.enable = true;
    synaptics.enable = false;
    #inputClassSections = [
    #  ''
    #    Identifier "Enable libinput for TrackPoint"
    #    MatchIsPointer "on"
    #    Driver "libinput"
    #    Option "Accel Speed" "-0.4"
    #  ''
    #];

    # desktopManager.xfce.enable = true;
    windowManager.qtile = {
      enable = true;
      backend = "wayland";
    };

    displayManager.sessionCommands = ''
      xscreensaver -no-splash &
    '';

    displayManager.sddm.enable = true;
  };

  physlock.enable = true;
};

}
