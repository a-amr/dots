# { config, pkgs-stable,pkgs, inputs, ... }:
{ config , pkgs,  ... }:
# let
# 	stable= import<nixos-stable> {};
# in
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
	system.activationScripts.diff = {
		supportsDryActivation = true;
		text = ''
			${pkgs.nvd}/bin/nvd --nix-bin-dir=${pkgs.nix}/bin diff  /run/current-system "$systemConfig"
		'';
	};

	networking.networkmanager.enable = true;
	networking.networkmanager.wifi.backend = "iwd";
	networking.hostName = "xxx"; # Define your hostname.

	time.timeZone = "Africa/Cairo";
	time.hardwareClockInLocalTime = true;
	i18n.defaultLocale = "en_US.UTF-8";

	# hardware.bluetooth.enable = true;
	# sound.enable = true;
	# hardware.pulseaudio.enable = false;
	# security.rtkit.enable = false;
	# services.pipewire = {
	# 	enable = true;
	# 	alsa.enable = true;
	# 	alsa.support32Bit = true;
	# 	pulse.enable = true;
	# 	wireplumber.enable = true;
	# };
	sound.enable = false; # not needed for pipewire
	hardware.pulseaudio.enable = false;
	services.pipewire = {
		enable = true;
		alsa = {
			enable = true;
			support32Bit = true;
		};
		jack.enable = true;
		pulse.enable = true;
	};
	######## will try this 

	security.sudo.wheelNeedsPassword = false;
	security.pam.services.gdm= {};
	security.pam.services.waylock = {};




	users.users.ababa = {
		isNormalUser = true;
		description = "ababa";
		extraGroups = ["wireshark" "libvirt" "input" "networkmanager" "flatpak" "docker" "wheel" "video" "audio" ];
		shell = pkgs.zsh;
	};
	users.defaultUserShell = pkgs.zsh;

	nixpkgs.config.allowUnfree = true;



	environment.systemPackages = with pkgs; [
		#  lxqt.lxqt-policykit
		#  wl-clip-persist
		obs-studio
		postman
		#  gnumake
		gcc
		#  swayidle
		#  tor-browser
		jetbrains.rust-rover
		#  onlyoffice-bin
		#  burpsuite
		#  puddletag #amazing app like mp3tag
		#  lynx

		#  for compiling kernel modules
		#  linuxPackages_latest.kernel.dev



		#  progs
		# vimPlugins.lazy-lsp-nvim
		bc #good calculator
		poppler_utils
		python3
		ftop
		kdenlive
		wget
		lua-language-server

		xdotool
		video-trimmer
		switcheroo
		blanket
		audio-sharing
		bucklespring-libinput
		metadata-cleaner
		#  not bad idea to use fileroller from gnome
		gnome.iagno # go game
		gnome.gnome-dictionary
		gnome.hitori # sudoku game
		gnome.atomix # puzzle game

		gimp
		pavucontrol
		# main apps
		telegram-desktop
		thunderbird
		mpv
		tmux
		foot
		firefox
		zathura
		freeoffice
		qutebrowser

		# hyprland
		imv
		bemenu
		dunst
		waylock
		hyprpaper
		waybar
		libinput-gestures
		ydotool

		# others
		# ollama
		nmap
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

		# about files
		trash-cli
		fzf
		ripgrep
		cloc
		fd
		unzip
		zoxide
		yazi
		tree
		# device info
		powertop
		psmisc
		btop
		acpi
		lsof #to see open ports 
		nmon
		htop
		# metadata
		exiftool
		file
		mediainfo
		xxd
		imagemagick
		wofi
		rofi
	];
	# environment.etc."file".text=''
	#   '';

	programs = { 
		# ssh.askPassword = pkgs.lib.mkForce "${pkgs.ksshaskpass.out}/bin/ksshaskpass";

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

		hyprland = {
			enable = true;
			xwayland.enable = true;
			#    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
		};




	};



	fonts.packages= with pkgs; [
		nerdfonts
	];




	services.xserver = {
		enable = true;
		displayManager.gdm.enable = true;
		# desktopManager.gnome.enable = true;
		# desktopManager.plasma6.enable = true;
	};
	services.desktopManager.plasma6.enable= true;

	
	nixpkgs.config.cudaSupport = true;
	services.ollama.acceleration = "cuda";
	services.ollama.enable = true;

	powerManagement.enable = true;
	services.openssh.enable = true;


	# try


	# services.private-gpt.enable= true;

	# services.private-gpt.package
	# services.private-gpt.stateDir
	# services.private-gpt.settings



	services.xserver.videoDrivers = ["nvidia"];
	hardware.nvidia = {
		modesetting.enable = true;  
		open = true; #try it  -----------------------------
		powerManagement.finegrained = true;
		nvidiaSettings = true; #also try it --------
		forceFullCompositionPipeline = false;
		package = config.boot.kernelPackages.nvidiaPackages.production;
	};
	hardware.nvidia.prime = {
		offload = {
			enable = true;
			enableOffloadCmd = true;
		};
		nvidiaBusId = "PCI:1:0:0";
		amdgpuBusId = "PCI:6:0:0";
	};
	# boot.kernelParams = [ "nvidia.modeset=0" ]; 
	# to disable nvidia
	# boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];



	# try





	system.stateVersion = "24.05";

	nix = {
		settings.experimental-features = "nix-command flakes";
		settings.auto-optimise-store = true;
		gc = {
			automatic = true;
			dates = "daily";
			options = "--delete-older-than 3d";
		};
	};
		systemd.extraConfig = ''
DefaultTimeoutStopSec=10s
		'';
	}
