# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];



  # Bootloader
boot.kernelParams = [ "quiet" "splash" "nvidia.modeset=1" ]; 
boot.kernelPackages = pkgs.linuxPackages_latest;

boot.loader = {
  efi = {
    canTouchEfiVariables = false;
  };
  grub = {
     efiSupport = true;
     efiInstallAsRemovable = true;
     device = "nodev";
     useOSProber = true;
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us,ara";
    xkb.variant = "digits";
    xkb.options = "ctrl:nocaps,grp:ctrls_toggle";
  };
  # Enable the Deepin Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.deepin.enable = false;
  services.xserver.desktopManager.plasma6.enable = true;
  services.xserver.windowManager.dwm.enable = true;




  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewlire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

#  services.kmonad = {
#  enable = true;
#  command = "/usr/bin/env kmonad /home/ababa/.config/kmonad/config45key.kbd &
#";
#};
#
#  services.kmonadexternal = {
#  enable = flase;
#  command = "/usr/bin/env kmonad /home/ababa/.config/kmonad/config45key2.kbd &
#";
#};
#
services.xserver.videoDrivers = ["nvidia"];
	hardware.nvidia = {
		modesetting.enable = true;
		open = false;
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.production;
		forceFullCompositionPipeline = true;
	};
	hardware.nvidia.prime = {
	#sync.enable = true;
		offload = {
			enable = true;
			enableOffloadCmd = true;
		};
		nvidiaBusId = "PCI:1:0:0";
		intelBusId = "PCI:6:0:0";
		};


security.sudo.wheelNeedsPassword = false;

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





environment.pathsToLink = [ "/share/zsh" ];


environment.variables.EDITOR = "nvim";
environment.variables.NNN_NO_AUTOSELECT="1";
environment.variables.NNN_TRASH="1	";
environment.variables.NNN_USE_EDITOR="1";
environment.variables.NNN_OPENER="xdg-open";
environment.variables.NNN_COLORS="23456789";
environment.variables.NNN_FCOLORS="c1e2272e006033f7c6d6abc4";
environment.variables.BROWSER="qutebrowser";
environment.variables.BROWSERCLI="lynx";
environment.variables.PAGER="nvimpager";
environment.variables.PS1="%m%# ";
#environment.variables.BEMENU_OPTS="--binding vim";






  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ababa = {
    isNormalUser = true;
    description = "ababa";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    shell = pkgs.zsh;
  };

programs = { 
		zsh.enable = true;
		nano.enable = false;
		light.enable = true;
	};





  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
 
  
  environment.systemPackages = with pkgs; [
    neovim
    nnn
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
    kbd
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
    waybar
    bemenu
    firefox
    #opera
    nvtop
    dolphin
    haskellPackages.kmonad
    psmisc
    nvimpager
    grim
    nsxiv
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
    hyprlock
    bicon

   
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
	#puddletag #amazing app like mp3tag
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.hyprland = {
enable = true;
xwayland.enable = true;
};

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
	services.dbus.enable = true;

# system.autoUpgrade = {
#   enable = true;
#   flake = inputs.self.outPath;
#   flags = [
#     "--update-input"
#     "nixpkgs"
#     "-L" # print build logs
#   ];
#   dates = "02:00";
#   randomizedDelaySec = "45min";
# };


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
#  system.stateVersion = "23.11"; # Did you read the comment?
  system.stateVersion = "24.05"; # Did you read the comment?

}
