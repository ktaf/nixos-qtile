{ config, pkgs, lib, inputs, user, ... }:

{

# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.${user} = {
  isNormalUser = true;
  description = "Kourosh";
  extraGroups = [ "networkmanager" "wheel" "qemu-libvirtd" "libvirtd" "kvm" "wheel" "disk" "docker" "audio" "video" "input" "systemd-journal" "network" "davfs2" ];
  packages = with pkgs; [
    auto-cpufreq
    waybar                                    #topbar 
    wayland-protocols
    libsForQt5.qt5.qtwayland
    libsForQt5.plasma-wayland-protocols
    qt6.qtwayland
    kanshi                                    #laptop dncies
    rofi mako rofimoji                        #Drawer + notifications
    jellyfin-ffmpeg                           #multimedia libs
    viewnior                                  #image viewr
    pavucontrol                               #Volume control
    xfce.thunar                               #filemanager
    gnome-text-editor
    gnome.file-roller
    gnome.gnome-font-viewer
    gnome.gnome-calculator
    vlc                                       #Video player
    amberol                                   #Music player
    cava                                      #Sound Visualized
    wf-recorder                               #Video recorder
    sway-contrib.grimshot                     #Screenshot
    ffmpegthumbnailer                         #thumbnailer
    playerctl                                 #play,pause..
    pamixer                                   #mixer
    brightnessctl                             #Brightness control
    wlr-randr
    wayland
    wayland-scanner
    wayland-utils
    egl-wayland
    xorg.xeyes
    glfw-wayland
    wev    
    alsa-lib
    alsa-utils
    flac
    pulsemixer
    linux-firmware
    sshpass
    rustc
    imagemagick
    flameshot
    bluez
    blueman
    gnome.file-roller
    htop
    intel-media-driver
    jetbrains-mono
    libva
    libsForQt5.qt5ct
    libsForQt5.sddm
    linuxHeaders
    lxappearance
    networkmanagerapplet
    noto-fonts-emoji
    nvidia-vaapi-driver
    libva-utils
    glxinfo
    polkit_gnome
    wofi
    xfce.xfce4-settings
    xdg-desktop-portal-wlr
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    electron
    wayland
    xdg-utils # for opening default programs when clicking links
    gnome3.adwaita-icon-theme  # default gnome cursors
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    wdisplays # tool to configure displays
    ####GTK Customization####
    nordic
    papirus-icon-theme
    gtk3
    glib # gsettings
    xcur2png
    rubyPackages.glib2
    libcanberra-gtk3                          #notification sound
    dracula-theme # gtk theme
    #########Login#########
    swaylock
    swaylock-effects
    swayidle
    swappy
    swaycons
    swww
    wlogout
    swaybg    
    #########System#########
    kitty
    zsh
    google-chrome
    firefox
    gnome.gnome-system-monitor
    libnotify
    poweralertd
    dbus
    #gsettings-desktop-schemas
    #wrapGAppsHook
    ####photoshop dencies####
    gnome.zenity
    wine64Packages.waylandFull
    curl
    #########################
  ];
};


# QT
qt = {
  enable = true;
  platformTheme = "qt5ct";
};

#thunar dencies
programs.thunar.plugins = with pkgs.xfce; [
  thunar-archive-plugin
  thunar-volman
  thunar-dropbox-plugin
  thunar-media-tags-plugin
];
services.gvfs.enable = true; 
services.tumbler.enable = true;

#gnome outside gnome
programs.dconf.enable = true;

#Steam
programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
};


# Configure keymap in X11
services.xserver = {
  layout = "us,ir";
  xkbVariant = "latitude";
  xkbOptions = "grp:alt_shift_toggle";
};

# User etc/
environment.etc."xdg/user-dirs.defaults".text= ''
  DESKTOP=System/Desktop
  DOWNLOAD=System/Downloads
  TEMPLATES=System/Templates
  PUBLICSHARE=System/Public
  DOCUMENTS=System/Documents
  MUSIC=Media/music
  PICTURES=Media/photos
  VIDEOS=Media/video 
  '';
}