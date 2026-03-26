#!/bin/bash
# =============================================================
# Script 2: FOSS Package Inspector
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | Chosen Software: Git
# Description: Checks if a FOSS package is installed, shows
#              its version/license, and prints a philosophy note
#              using a case statement.
# =============================================================

# --- Package to inspect (our chosen software) ---
PACKAGE="git"

echo "================================================================"
echo "         FOSS PACKAGE INSPECTOR"
echo "================================================================"
echo ""

# --- Detect package manager and check installation ---
# Using if-then-else to handle both RPM-based and Debian-based systems
if command -v rpm &>/dev/null; then
    # RPM-based systems (Fedora, RHEL, CentOS)
    if rpm -q $PACKAGE &>/dev/null; then
        echo "  [FOUND] '$PACKAGE' is installed on this system (RPM)."
        echo ""
        echo "  Package Details:"
        echo "  ----------------"
        # Use grep with pipe to extract only relevant fields
        rpm -qi $PACKAGE | grep -E "^(Name|Version|License|Summary|URL)" | \
            awk -F: '{printf "  %-12s: %s\n", $1, substr($0, index($0,$2))}'
    else
        echo "  [NOT FOUND] '$PACKAGE' is NOT installed."
        echo "  To install: sudo dnf install git"
    fi

elif command -v dpkg &>/dev/null; then
    # Debian/Ubuntu-based systems
    if dpkg -l $PACKAGE 2>/dev/null | grep -q "^ii"; then
        echo "  [FOUND] '$PACKAGE' is installed on this system (dpkg)."
        echo ""
        echo "  Package Details:"
        echo "  ----------------"
        # dpkg -s gives full info; pipe through grep for key fields
        dpkg -s $PACKAGE | grep -E "^(Package|Version|License|Description|Homepage)" | \
            awk -F: '{printf "  %-12s: %s\n", $1, substr($0, index($0,$2))}'
    else
        echo "  [NOT FOUND] '$PACKAGE' is NOT installed."
        echo "  To install: sudo apt install git"
    fi

else
    # Fallback: try 'which' command
    if which $PACKAGE &>/dev/null; then
        echo "  [FOUND] '$PACKAGE' is available at: $(which $PACKAGE)"
        # Show version directly from git
        echo "  Version: $(git --version)"
    else
        echo "  [NOT FOUND] Could not locate '$PACKAGE'."
    fi
fi

echo ""
echo "----------------------------------------------------------------"
echo "  OPEN SOURCE PHILOSOPHY NOTE"
echo "----------------------------------------------------------------"
echo ""

# --- Case statement: prints a philosophy note based on package name ---
case $PACKAGE in
    git)
        echo "  Git: Born from crisis — when BitKeeper revoked its free"
        echo "  license in 2005, Linus Torvalds built Git in two weeks."
        echo "  GPL-2.0 ensures no proprietary tool can hold Linux hostage again."
        ;;
    httpd | apache2)
        echo "  Apache: The web server that built the open internet."
        echo "  Apache 2.0 license lets companies use it freely without"
        echo "  being forced to open-source their own products."
        ;;
    mysql | mariadb)
        echo "  MySQL/MariaDB: Open source at the heart of millions of apps."
        echo "  Its dual GPL/commercial license sparked debates about"
        echo "  what 'open source' truly means for business."
        ;;
    firefox)
        echo "  Firefox: A nonprofit browser fighting for an open web."
        echo "  MPL 2.0 — Mozilla's license that balances openness with"
        echo "  practical use, keeping the web from being monopolized."
        ;;
    vlc)
        echo "  VLC: Plays anything — born from a university streaming project."
        echo "  LGPL/GPL licensed, it shows students can build tools the"
        echo "  whole world uses without a corporate sponsor."
        ;;
    python3 | python)
        echo "  Python: A language shaped entirely by its community."
        echo "  The PSF license is permissive and business-friendly, which"
        echo "  is a big reason Python became the world's most-used language."
        ;;
    libreoffice)
        echo "  LibreOffice: Born from a community fork of OpenOffice."
        echo "  MPL 2.0 — a real lesson in how communities can take back"
        echo "  control when a corporate owner loses the project's vision."
        ;;
    *)
        echo "  '$PACKAGE': An open-source tool built on the principle"
        echo "  that knowledge shared is knowledge multiplied."
        ;;
esac

echo ""
echo "================================================================"
