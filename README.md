# hyprfya: My own Hyprland Starter Setup (Experimental)

⚠️ **Warning** This setup is **highly experimental** and **not complete**.
Expect bugs, missing features, and the need for manual adjustments. Use at
your own risk, and feel free to modify as you go.

---

## Overview

This repository provides a basic starting point for a **Hyprland** desktop
environment on **Arch Linux**. It installs a selection of packages and copies
pre-defined configuration files to their appropriate directories.

It is designed primarily as a **personal setup**, so please read through the
scripts and configuration files before running anything.

---

## Requirements

- **Arch Linux (btw)**
- **Internet connection**
- **`git` installed**

---

## Recommended Installation Method

If you are starting from scratch, the fastest way is to install Arch using
`archinstall`:

1. Boot into the Arch installer.
2. Run:
   ```bash
   archinstall
   ```
3. When prompted:
   - Choose the **profile**: `minimal`
   - Make sure networking is configured
   - Ensure **git** is included in the installation or install it afterwards:
     ```bash
     pacman -S git
     ```

---

## Installation

Once your Arch system is up and running:

```bash
git clone https://github.com/drjchris/hyprfya.git
cd hyprfya
./install.sh
```

The installer will:

1. Read the list of packages from `apps_to_install.txt`
2. Install them via `pacman`
3. Copy configuration files from `configs/` to the appropriate directories in `~/.config/`

---

## Customising

### Packages

All packages to be installed are listed in:

```
apps_to_install.txt
```

Feel free to **remove** packages you don’t need or **add** additional ones
before running `install.sh`.

### Configurations

Custom configuration files are located in the:

```
configs/
```

The installation script automatically copies them to their respective
directories after installing all packages. Review and modify them to match
your setup, monitors, input devices, theme, etc.

---

## Status

| Component        | Status      |
|------------------|------------|
| Package install  | ✅ Basic working for pacman stuff only |
| Hyprland config  | 🟡 Minimal stuff, couple things here and there |
| Theming          | 🔴 Yeah, no. Not even started|
| Documentation    | 🟡 Mediocre at best, but some |

---

## Notes

- This is a **starter setup**, not a polished “dotfiles pack”.
- Expect to iterate.
- Useful for learning Hyprland, tweaking window manager workflows, and
  building your own environment.

---

## Contribution / Feedback

Open an **issue** or submit a **PR** if you have improvements, ideas, or bug fixes.
Even better: **fork it** and shape it to your needs. 🙌
