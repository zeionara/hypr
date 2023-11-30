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

1. Set up `accept-keywords` for `alacritty`:

```sh
x11-terms/alacritty ~amd64
```

2. Set up `use` flags for `waybar`:

```sh
gui-apps/waybar network pulseaudio tray wifi experimental
```

3. Enable screencasting use flags globally in `make.conf`:

```sh
USE="pipewire icu screencast vaapi v4l openh264 nvenc vlc"
```

4. Disable `vaapi` use flag for `vlc`:

```sh
media-video/vlc -vaapi
```

5. Upgrade the system:

```sh
sudo emerge --sync
sudo emerge --ask --verbose --update --deep --newuse @world
```

6. Install the new packages:

```sh
sudo emerge --ask gui-wm/hyprland gui-apps/waybar gui-apps/grim gui-apps/slurp gui-apps/wl-clipboard gui-apps/mako gui-apps/wf-recorder media-libs/gstreamer
```

7. Copy the configuration files for [hyprland](https://github.com/zeionara/hypr/blob/master/setup.sh) and [waybar](https://github.com/zeionara/waybar/blob/master/setup.sh) making the environment-specific tweaks;

8. Install `xdg portal`:

Compile from source (recommended):

```sh
git clone --recursive https://github.com/hyprwm/xdg-desktop-portal-hyprland "$HOME/xdg-desktop-portal-hyprland"
cd "$HOME/xdg-desktop-portal-hyprland"
make all
sudo make install
sudo ln /usr/lib/xdg-desktop-portal-hyprland /usr/libexec/
```

Or install from `guru`:

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

9. Log-out and log-in or start `Hyprland` on `dbus` manually:

```sh
dbus-launch Hyprland
```
