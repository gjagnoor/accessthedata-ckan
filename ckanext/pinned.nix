let
  unstableTgz = builtins.fetchTarball {
    # Descriptive name to make the store path easier to identify
    name = "nixos-nixos-unstable-2022-07-07";
    # Be sure to update the above if you update the archive
    url = https://github.com/nixos/nixpkgs/archive/4a01ca36d6bfc133bc617e661916a81327c9bbc8.tar.gz;
    sha256 = "0asz4dchfyf1xw4n3z9yygb48nsyhdr9mwkxi05bz54x2h0mdqpp";
  };
in
import unstableTgz {}
