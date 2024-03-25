# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs-stable,pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
#      <home-manager/nixos> 
    ];


 hardware.opentabletdriver.enable = true;

  # Bootloader
boot.kernelParams = [ "nvidia.modeset=0" ]; 
boot.kernelPackages = pkgs.linuxPackages_latest;
boot.resumeDevice = "";


boot.loader = {
  efi = {
    canTouchEfiVariables = false;
  };
  grub = {
     efiSupport = true;
     efiInstallAsRemovable = true;
     device = "nodev";
     useOSProber = false;
  };
};
  # Enable networking
  networking.networkmanager.enable = true;


  networking.hostName = "xxx"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  # Set your time zone.
  time.timeZone = "Africa/Cairo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    enable = false;
 #   xkb.layout = "us,ara";
 #   xkb.variant = "digits";
 #   xkb.options = "ctrl:nocaps,grp:ctrls_toggle";
  };
  #services.xserver.displayManager.sddm.wayland.enable= true;
  services.xserver.displayManager.gdm.enable = true;
  #services.desktopManager.plasma6.enable = true;
  services.auto-cpufreq.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewlire.
  hardware.bluetooth.enable = true;
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
  };

#  services.kmonad = {
#  enable = true;
#  command = "/usr/bin/env kmonad /home/ababa/.config/kmonad/config45key.kbd &
#";
#};
#
#  services.kmonadexternal = {
#  enable = false;
#  command = "/usr/bin/env kmonad /home/ababa/.config/kmonad/config45key2.kbd &
#";
#};
#
services.xserver.videoDrivers = ["nvidia"];
	hardware.nvidia = {
		modesetting.enable = true;  
		open = false;
		powerManagement.finegrained = true;
		nvidiaSettings = false;
		#package = config.boot.kernelPackages.nvidiaPackages.stable;
		forceFullCompositionPipeline = true;
		package = config.boot.kernelPackages.nvidiaPackages.production;
	};
	hardware.nvidia.prime = {
	#sync.enable = true;
		offload = {
			enable = true;
			enableOffloadCmd = true;
		};
		nvidiaBusId = "PCI:1:0:0";
		amdgpuBusId = "PCI:6:0:0";
		};
#to disable nvidia
#boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];



security.sudo.wheelNeedsPassword = false;
security.polkit.enable = true ;
security.pam.services.swaylock = {};
security.pam.services.gdm= {};
security.pam.services.waylock = {};

# udisk mounting
	services.udisks2 = {
		enable = true;
		mountOnMedia = true;
	};


# Faster shutdown and reboot
systemd.extraConfig = ''
DefaultTimeoutStopSec=10s
DefaultDeviceTimeoutStopSec=10s
'';





#environment.pathsToLink = [ "/share/zsh" ];


environment.variables.EDITOR = "nvim";
environment.variables.NNN_NO_AUTOSELECT="1";
environment.variables.NNN_TRASH="1	";
environment.variables.NNN_USE_EDITOR="1";
environment.variables.NNN_OPENER="xdg-open";
environment.variables.NNN_COLORS="23456789";
environment.variables.NNN_FCOLORS="c1e2272e006033f7c6d6abc4";
environment.variables.BROWSER="qutebrowser";
environment.variables.BROWSERCLI="lynx";
#environment.variables.PAGER="nvimpager";
environment.variables.PS1="%m%# ";
environment.variables.QT_QPA_PLATFORMTHEME="qt6ct";
#environment.variables.BEMENU_OPTS="--binding vim";






  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ababa = {
    isNormalUser = true;
    description = "ababa";
    extraGroups = ["input" "networkmanager" "flatpak" "wheel" "video" "audio" ];
    shell = pkgs.zsh;
  };

home-manager = {
extraSpecialArgs = {inherit inputs; };
users = {
"ababa" = import ./home.nix ;
};
};



  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
 
  
  environment.systemPackages = with pkgs; [
    #neovim
    nnn
    (pkgs-stable.waybar)
    foot
    gparted
    neomutt
    mailcap
    ripgrep 
    tmux
    mpv
    yt-dlp
    qutebrowser
    fzf
    sxiv
    zathura
    aria
    ffmpeg
    git
    trash-cli
    btop
    tldr
    telegram-desktop
    gnome.gnome-disk-utility
    blueman
    #waybar
    bemenu
    firefox
    nvtopPackages.nvidia
    #haskellPackages.kmonad
    psmisc
    #nvimpager
    grim
    slurp
    advcpmv
    wdisplays
    light
    fd
    powertop
    gcc
    gnumake
    tree
    unzip
    lxqt.lxqt-policykit
    kdePackages.qt6ct
    #kdePackages.kdeconnect-kde
    bicon
    pavucontrol
    unityhub
    ttyper
    lynx
    urlscan
    ollama
    wl-clip-persist
    wl-clipboard
    #kdePackages.dolphin
    onlyoffice-bin
    burpsuite
    nwg-look
    st
    dmenu
    zsh-fzf-tab
    imv
    #for testing ----
    dwl
    waylock
    swaylock-fancy
    swayidle
    wine
    wlsunset
    teams-for-linux
    obs-studio
    xdg-utils
    sops
    nix-tree
    nix-du
    nix-index
    yazi
    zoxide
    gnome.nautilus
    exiftool
    galculator
    wev
    hyprpaper
    home-manager
    ytfzf
    libinput-gestures
    libinput
    wmctrl
    protonup-qt
    linuxHeaders
    linux.dev
    nukeReferences
    oversteer
    hypridle
    dissent

    #progs
    bash-completion
    git
    wget
    gimp
    qemu_kvm
    qemu
    libvirt
    virt-manager
    dunst
    puddletag #amazing app like mp3tag
    #to build hyprgrass
    
    glm

# build dependencies
    meson
    ninja
    pkg-config
    cmake
  ];

fonts.packages= with pkgs; [
   nerdfonts
];
nixpkgs.config.cudaSupport = false;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "ababa" ];




#nixpkgs.overlays = [
#    (
#      final: prev:
#        {
#          dwl = prev.dwl.override { conf = ./dwl-config.h; };
#        }
#    )
#  ];





programs = { 

#waybar.enable = true;

steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
};
  zsh.enable = true;
  zsh.interactiveShellInit = ''
    source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
'';

  nano.enable = false;
  light.enable = true;
  fzf.keybindings = true;
  hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
    neovim.defaultEditor = true;
    neovim.enable = true;
    neovim.vimAlias = true;
    neovim.viAlias = true ;
    kdeconnect.enable = true ;

  };



  # Enable the OpenSSH daemon.
services.openssh.enable = true;
services.dbus.enable = true;
services.flatpak.enable = true;



  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;











#  system.stateVersion = "23.11"; # Did you read the comment?
 system.stateVersion = "24.05"; # Did you read the comment?

nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };

  # Optimize storage
  # You can also manually optimize the store via:
  #    nix-store --optimise
  # Refer to the following link for more details:
  # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
  nix.settings.auto-optimise-store = true;
}
