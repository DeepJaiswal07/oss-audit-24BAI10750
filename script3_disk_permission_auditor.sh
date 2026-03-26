#!/bin/bash
# =============================================================
# Script 3: Disk and Permission Auditor
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | Chosen Software: Git
# Description: Loops through key system directories and reports
#              disk usage, owner, and permissions. Also checks
#              Git's config directory.
# =============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/share/doc/git")

echo "================================================================"
echo "         DISK AND PERMISSION AUDITOR"
echo "================================================================"
echo ""
printf "  %-25s %-20s %-10s\n" "DIRECTORY" "PERMISSIONS (perms owner grp)" "SIZE"
echo "  ------------------------------------------------------------------------"

# --- For loop: iterate over each directory in the DIRS array ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, and group using ls and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # Get disk usage; suppress permission-denied errors with 2>/dev/null
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print formatted row
        printf "  %-25s %-20s %-10s\n" "$DIR" "$PERMS" "$SIZE"
    else
        # Directory doesn't exist on this system
        printf "  %-25s %s\n" "$DIR" "[does not exist on this system]"
    fi
done

echo ""
echo "----------------------------------------------------------------"
echo "  GIT CONFIG DIRECTORY CHECK"
echo "----------------------------------------------------------------"
echo ""

# --- Check Git's global config file (stored in user's home directory) ---
GIT_GLOBAL_CONFIG="$HOME/.gitconfig"
GIT_SYSTEM_CONFIG="/etc/gitconfig"

# Check user-level git config
if [ -f "$GIT_GLOBAL_CONFIG" ]; then
    echo "  [FOUND] Git global config: $GIT_GLOBAL_CONFIG"
    # Show permissions of the file
    PERMS=$(ls -l "$GIT_GLOBAL_CONFIG" | awk '{print $1, $3, $4}')
    echo "  Permissions : $PERMS"
    echo "  This file is user-owned — only $USER can modify it."
else
    echo "  [NOT FOUND] No global git config at $GIT_GLOBAL_CONFIG"
    echo "  Run 'git config --global user.name \"Your Name\"' to create it."
fi

echo ""

# Check system-level git config
if [ -f "$GIT_SYSTEM_CONFIG" ]; then
    echo "  [FOUND] Git system config: $GIT_SYSTEM_CONFIG"
    PERMS=$(ls -l "$GIT_SYSTEM_CONFIG" | awk '{print $1, $3, $4}')
    echo "  Permissions : $PERMS"
    echo "  This file is system-wide — requires root to modify."
else
    echo "  [NOT FOUND] No system git config at $GIT_SYSTEM_CONFIG"
fi

echo ""
echo "----------------------------------------------------------------"
echo "  WHY PERMISSIONS MATTER IN OPEN SOURCE"
echo "----------------------------------------------------------------"
echo "  Git stores its config with user-level ownership, ensuring"
echo "  each user on a shared Linux system has independent identity."
echo "  This reflects the open-source principle of transparency —"
echo "  every commit is traceable to a real, authenticated identity."
echo "================================================================"
