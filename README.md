# Hypr

Hyprland configuration files

## Installation

To install run the following steps:

1. Install the `hyprland` (specific steps vary depending on the distribution);
2. Clone the repo:

```sh
git clone git@github.com:zeionara/hypr.git "$HOME/hypr"
```

3. Setup the configuration files - run script `setup.sh`:

```sh
~/hypr/setup.sh
```

### Gentoo

To install on `gentoo` the main steps are the following:

1. Install `hyprland` and `waybar` (`waybar` requires `experimental` flag to support `workspaces` listing, also see other flags on the package page which may be useful):

```sh
sudo emerge --ask gui-wm/hyprland gui-apps/waybar
```

2. Copy the configuration files according to instructions above;

3. Set up `xdg desktop portal`:

```sh
sudo emerge --ask app-eselect/eselect-repository

sudo eselect repository enable guru
sudo emerge --sync guru
sudo emerge --ask gui-libs/xdg-desktop-portal-hyprland
```

> [!IMPORTANT]
> There may be an installation error when merging `xdg-desktop-portal-hyprland` which says that `sdbus-c++` is missing even if it's installed. The error is solved by creating a symlink to the `elogind` package config:
> ```sh
> sudo ln -s /usr/lib64/pkgconfig/libelogind.pc /usr/lib64/pkgconfig/elogind.pc
> ```

4. Install additional software (for taking screenshots):

```sh
sudo emerge --ask gui-apps/grim gui-apps/slurp gui-apps/wl-clipboard
```

4. Restart `Hyprland` on `dbus`:

```sh
dbus-launch Hyprland
```
