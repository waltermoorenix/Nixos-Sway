
{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "cyberstation"; 
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
        user = "moore";
};



  services.xserver.xkb = {
    layout = "pt";
    variant = "";
  };

  console.keyMap = "pt-latin1";
  
  users.users.moore = {
    isNormalUser = true;
    description = "Walter Moore";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  

  
  nixpkgs.config.allowUnfree = true;
  programs.sway = {
         enable = true;
         wrapperFeatures.gtk = true;
};
  
  
    environment.systemPackages = with pkgs; [
    vim 
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
  ];

  
  system.stateVersion = "25.05"; 

}
