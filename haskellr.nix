{pkgs ? import <nixpkgs> { }, ghc ? pkgs.haskell.compiler.ghc822}:

with pkgs;

let
  # Uncomment the line below to build HaskellR against a version of R with
  # the --enable-strict-barrier configure flag enabled for better memory
  # diagnostics.

  # R = pkgs.R.override { enableStrictBarrier = true; };

  # XXX Workaround https://ghc.haskell.org/trac/ghc/ticket/11042.
  libHack = if stdenv.isDarwin then {
      DYLD_LIBRARY_PATH = ["${R}/lib/R/lib"];
    } else {
      LD_LIBRARY_PATH = ["${R}/lib/R"];
    };
in

haskell.lib.buildStackProject ({
  name = "HaskellR";
  inherit ghc;
  src = pkgs.fetchFromGitHub {
    owner  = "tweag";
    repo   = "HaskellR";
    rev    = "59e8540f6fd6c84acba1655d758bab637b675219";
    sha256 = "0v9yxj4dsnl3c7qyjiwsj367z0ksy936fks9db5z3gcb5339fwrm";
  };
  buildInputs =
    [ python36Packages.ipython
      python36Packages.jupyter_client
      python36Packages.notebook
      R
      zeromq
      zlib
    ];
  LANG = "en_US.UTF-8";
  LD_LIBRARY_PATH = ["${R}/lib/R/"];
} // libHack)
