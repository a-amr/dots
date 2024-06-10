{inputs, pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    # ...
    extraConfig =''
    source=/home/ababa/Downloads/Hypr/hyprland.conf
    '';
    plugins = [
      #inputs.hyprgrass.packages.${pkgs.system}.default
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    ];
  };
  home.stateVersion = "24.05";
}
