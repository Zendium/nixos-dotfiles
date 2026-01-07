{
  config,
  pkgs,
  lib,
  ...
}:

let
  oxanium = pkgs.fetchFromGitHub {
    owner = "google";
    repo = "fonts";
    rev = "3b1bbfe889daea4292264390f179552a43bbb43b";

    sparseCheckout = [
      "ofl/oxanium"
    ];

    sha256 = "sha256-OZCuk5BDXRVZEA2RzTnzI6leIC6uNoGul1ABorV+H3Q=";
  };

  oxaniumFont = pkgs.stdenv.mkDerivation {
    pname = "oxanium-font";
    version = "1.0";
    src = oxanium;

    installPhase = ''
      mkdir -p $out/share/fonts/truetype/oxanium
      cp ofl/oxanium/*.ttf $out/share/fonts/truetype/oxanium/
    '';

    meta = with lib; {
      description = "Oxanium font family";
      license = licenses.ofl;
    };
  };
in
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      oxaniumFont
      quicksand
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      dejavu_fonts
      liberation_ttf
      jetbrains-mono
      nerd-fonts.symbols-only
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [
          "JetBrains Mono"
          "DejaVu Sans Mono"
        ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
      };
    };
  };
}
