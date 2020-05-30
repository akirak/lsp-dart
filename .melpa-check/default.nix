{
  # The default version of Emacs to use
  emacs ? "snapshot",
  # You can use niv to update melpa-check
  melpa-check ? import (import ../nix/sources.nix).melpa-check,
  # The directory containing source files
  srcDir ? ../.,
  # Snapshot of emacs-overlay to use for builds
  emacs-overlay ? import (import ../nix/sources.nix).emacs-overlay,
  # A configuration file which defines packages under test
  packageFile ? ".melpa-check/packages.dhall"
}:
melpa-check {
  inherit emacs packageFile srcDir emacs-overlay;
}
