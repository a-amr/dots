
{ config, pkgs-stable,pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];



boot.consoleLogLevel = 7;
boot.kernelPackages = pkgs.linuxPackages_latest;
boot.loader = {
timeout = 2;
systemd-boot.enable= true;
};



  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  networking.hostName = "xxx"; # Define your hostname.

  time.timeZone = "Africa/Cairo";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_US.UTF-8";

  hardware.bluetooth.enable = true;
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };


security.sudo.wheelNeedsPassword = false;
security.pam.services.hyprlock = {};
security.pam.services.gdm= {};
security.pam.services.waylock = {};





  users.users.ababa = {
    isNormalUser = true;
    description = "ababa";
    extraGroups = ["wireshark" "libvirt" "input" "networkmanager" "flatpak" "docker" "wheel" "video" "audio" ];
    shell = pkgs.zsh;
  };


  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";




  environment.systemPackages = with pkgs; [
#    lxqt.lxqt-policykit
#    wl-clip-persist
    obs-studio
    postman
#    gnumake
#    gcc
#    swayidle
#    tor-browser
#    pkgs.jetbrains.rust-rover
#    onlyoffice-bin
#    burpsuite
#    puddletag #amazing app like mp3tag
#    lynx

#    for compiling kernel modules
#    linuxPackages_latest.kernel.dev



   #progs
   bucklespring
   gnome.iagno # go game
   gnome.hitori # sudoku game
   gnome.atomix # puzzle game

    gimp
    pavucontrol
    #main apps
    telegram-desktop
    thunderbird
    mpv
    tmux
    foot
    firefox
    zathura
    freeoffice
    qutebrowser

    #hyprland
    imv
    bemenu
    dunst
    waylock
    hyprpaper
    waybar
    libinput-gestures
    ydotool

    #others
    ollama
    ffmpeg
    wl-clipboard
    texliveFull
    neomutt
    yt-dlp
    aria
    git
    tldr
    bicon
    ttyper
    gh

    #about files
    trash-cli
    fzf
    ripgrep
    cloc
    fd
    unzip
    zoxide
    yazi
    tree
    #device info
    powertop
    psmisc
    btop
    acpi
    lsof #to see open ports 
    nmon
    htop
    #metadata
    exiftool
    file
    mediainfo
    xxd
   imagemagick
  ];

programs = { 

  kdeconnect.enable = true ;
  neovim.defaultEditor = true;
  neovim.enable = true;
  neovim.vimAlias = true;
  neovim.viAlias = true ;
  nano.enable = false;
  light.enable = true;
  zsh.enable = true;
  zsh.autosuggestions.enable = true;
  zsh.syntaxHighlighting.enable = true;
  zsh.interactiveShellInit = ''
    source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
    '';
#  hyprland = {
#    enable = true;
#    xwayland.enable = true;
##    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
#  };
};



fonts.packages= with pkgs; [
   nerdfonts
];




  services.xserver = {
  enable = true;
  displayManager.gdm.enable = true;
  desktopManager.gnome.enable = true;
  };



powerManagement.enable = true;
services.openssh.enable = true;

system.stateVersion = "24.05";

nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };
  nix.settings.auto-optimise-store = true;
}
