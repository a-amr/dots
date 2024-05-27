# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs-stable,pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      #inputs.home-manager.nixosModules.default
      #<home-manager/nixos> 
    ];


boot.kernelParams = [
"resume=/.swapfile"
#"loglevel=5"
#"splash"
#"nvidia.modeset=0"
#"amd_iommu=on"
#"iommu=pt"
#"vfio-pci.ids=10de:2520,10de:228e"
];

boot.consoleLogLevel = 7;
#boot.initrd.availableKernelModules = [ "amdgpu" "vfio-pci" ];
#boot.kernelModules = [ "kvm-amd" ];
#boot.plymouth.enable - true;
  # Bootloader
#boot.kernelParams = [ "nvidia.modeset=0" ]; 
boot.kernelPackages = pkgs.linuxPackages_latest;

boot.loader = {
timeout = 2;
systemd-boot.enable= true;
};
###     efi = {
###       canTouchEfiVariables = false;
###     };
###     grub = {
###        efiSupport = true;
###        efiInstallAsRemovable = true;
###        device = "nodev";
###        useOSProber = false;
###     };



###   boot.initrd.preDeviceCommands = ''
###     DEVS="0000:01:00.0 0000:01:00.1"
###     for DEV in $DEVS; do
###       echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
###     done
###     modprobe -i vfio-pci
###   '';


  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  networking.hostName = "xxx"; # Define your hostname.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  time.timeZone = "Africa/Cairo";
  time.hardwareClockInLocalTime = true;

  i18n.defaultLocale = "en_US.UTF-8";

###   come check this
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

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
  };


security.sudo.wheelNeedsPassword = false;
security.polkit.enable = true ;
security.pam.services.hyprlock = {};
security.pam.services.gdm= {};
security.pam.services.waylock = {};





  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ababa = {
    isNormalUser = true;
    description = "ababa";
    extraGroups = ["wireshark" "libvirt" "input" "networkmanager" "flatpak" "docker" "wheel" "video" "audio" ];
    shell = pkgs.zsh;
  };

###home-manager = {
###extraSpecialArgs = {inherit inputs; };
###users = {
###"ababa" = import ./home.nix ;
###};
###};

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";




 
  
  environment.systemPackages = with pkgs; [
#    foot
#    gparted
#    gnome.gnome-disk-utility
#    mailcap
#    mpv
#    qutebrowser
#    ffmpeg
#    bemenu
#    grim
#    slurp
#    wdisplays
#    pavucontrol
#    lxqt.lxqt-policykit
#    unityhub
#    urlscan
#    wl-clip-persist
#    wl-clipboard
#    wine
#    wlsunset
#    obs-studio
#    xdg-utils
#    protontricks
#    galculator
#    wev
#    libinput-gestures
#    protonup-qt
#    swayidle
#    dolphin
#    maven
#    postman
#    openjdk
#    ydotool
#    dunst
#    gnumake
#    gcc
#    emacs
#    hypridle
#    zsh-system-clipboard
#    (pkgs.callPackage /home/ababa/Downloads/git/LegacyFox/legacyFox.nix {})
#    pkg-config
#    texliveTeTeX
#    tor-browser
#    gtk3
#    mysql-workbench
#    nodejs
#    jdk22
#    mysql_jdbc
#    pkgs.jetbrains.rust-rover
#    onlyoffice-bin
#    ollama
    #burpsuite
    #nwg-look
    #zsh-fzf-tab
    #home-manager
    #dissent
    #virtio-win
    #puddletag #amazing app like mp3tag
    #blueman
    #(pkgs-stable.waybar)
    #gcc
    #gnumake
    #tree
    #kdePackages.qt6ct
    #kdePackages.kdeconnect-kde
    #kdePackages.dolphin
    #lynx

    freeoffice
    neomutt
    ripgrep
    tmux
    yt-dlp
    fzf
    zathura
    aria
    git
    trash-cli
    btop
    tldr
    telegram-desktop
    psmisc
    fd
    powertop
    unzip
    bicon
    ttyper
    imv
    waylock
    yazi
    zoxide
    gnome.nautilus
    exiftool
    hyprpaper
    linuxPackages_latest.kernel.dev
    firefox
    gh
    tree
    file
    xxd
    mediainfo
    cloc

    #(import /home/ababa/osproj/default.nix)
  ];

programs = { 
#  waybar.enable = true;
#  steam.enable = true;
  kdeconnect.enable = true ;
  neovim.defaultEditor = true;
  neovim.enable = true;
  neovim.vimAlias = true;
  neovim.viAlias = true ;
#  fzf.keybindings = true;
#  fzf.fuzzyCompletion = true;
  nano.enable = false;
#  light.enable = true;
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
#};



fonts.packages= with pkgs; [
   nerdfonts
];



#services.xserver.videoDrivers = ["nvidia"];
#	hardware.nvidia = {
#		modesetting.enable = true;  
#		open = true; #try it  -----------------------------
#		powerManagement.finegrained = true;
#		nvidiaSettings = true; #also try it --------
#		forceFullCompositionPipeline = false;
#		package = config.boot.kernelPackages.nvidiaPackages.production;
#	};
#	hardware.nvidia.prime = {
#		offload = {
#			enable = true;
#			enableOffloadCmd = true;
#		};
#		nvidiaBusId = "PCI:1:0:0";
#		amdgpuBusId = "PCI:6:0:0";
#		};



#to disable nvidia
#boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];


  # Configure keymap in X11
  services.xserver = {
    #enable = true;
    enable = false;
 #   xkb.layout = "us,ara";
 #   xkb.variant = "digits";
 #   xkb.options = "ctrl:nocaps,grp:ctrls_toggle";
  };
  #services.xserver.displayManager.sddm.wayland.enable= true;
  services.desktopManager.plasma6.enable = true;


#nixpkgs.config.cudaSupport = false;
#services.ollama.acceleration = "cuda";



# udisk mounting
	services.udisks2 = {
		enable = true;
	};

#services.flatpak.enable = true;

services.openssh.enable = true;
services.dbus.enable = true;


services.tlp = {
  enable = true;
  settings = {
    CPU_BOOST_ON_AC = 1;
    CPU_BOOST_ON_BAT = 0;
    CPU_SCALING_GOVERNER_ON_AC = "performence";
    CPU_SCALING_GOVERNER_ON_BAT = "powersave";
};
};
services.system76-scheduler.settings.cfsProfiles.enable = true ;




#programs.virt-manager.enable = true;
#virtualisation.libvirtd = {
#  enable = true;
#};

 system.stateVersion = "23.11"; 

nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };
  nix.settings.auto-optimise-store = true;
}
