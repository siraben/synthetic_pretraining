let
  mach-nix = import (builtins.fetchGit {
    url = "https://github.com/DavHau/mach-nix";
    ref = "refs/tags/3.5.0";
  }) {
    pypiDataRev = "4bcaf526de8cbcad2c1eb3bc0160363ce370086b";
    pypiDataSha256 = "sha256:1x4ds63dcg975vrirnwhmxh68zfivbxdasg37fdk7iiy8nv12hin";
  };
in

mach-nix.mkPythonShell rec {

  requirements = builtins.readFile ./requirements.txt;
  packagesExtra = with mach-nix.nixpkgs; [
    libpng
  ];
  providers = {
    # disallow wheels by default
    _default = "sdist,wheel,nixpkgs";
  };
}
