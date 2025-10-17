

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
 

  networking.hostName = "nixos"; 
  programs.waybar.enable = true; 
  networking.networkmanager.enable = true;

  
  time.timeZone = "Europe/Lisbon";

  
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };



  services.greetd.enable = true;
  services.greetd.settings.default_session =  {
        command = "sway";
        user = "moorenix";
};



  services.xserver.xkb = {
    layout = "pt";
    variant = "";
  };

  console.keyMap = "pt-latin1";
  
  users.users.moorenix = {
    isNormalUser = true;
    description = "Walter Moore";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };


  programs.virt-manager.enable = true;

  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  
  nixpkgs.config.allowUnfree = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
};
  
  
    environment.systemPackages = with pkgs; [
    vim
    audacious
    krita
    wget
    alacritty
    waybar
    grim slurp
    wl-clipboard
    mako
    btop
    pcmanfm
    cava
    fastfetch
    swaybg
    chromium
    wofi
    direnv
    git
    gcc
    v4l-utils
    at
    obs-studio
    vscodium
    dunst
    autotiling
    pavucontrol
    shotman
    gruvbox-gtk-theme 
  ];

  
  system.stateVersion = "25.05"; 

}
