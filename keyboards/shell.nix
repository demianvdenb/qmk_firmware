{ pkgs ? import <nixpkgs> {} }:

let
  python = pkgs.python3;
  python-with-packages = python.withPackages (ps: with ps; [
    milc
    hidapi
    intelhex
    setuptools
    pip
    appdirs
    argcomplete
    colorama
    dotty-dict
    hid
    hjson
    jsonschema
    milc
    pygments
    pyserial
    pyusb
    pillow
  ]);
in

pkgs.mkShell {
  buildInputs = [
    python-with-packages
    pkgs.qmk
    pkgs.dfu-util
    pkgs.avrdude
  ];

  shellHook = ''
    export PATH=$PATH:$HOME/.local/bin
    echo "✅ QMK environment ready. Run: qmk setup or qmk compile"
  '';
}

