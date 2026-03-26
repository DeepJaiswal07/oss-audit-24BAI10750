#!/bin/bash
# =============================================================
# Script 1: System Identity Report
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | Chosen Software: Git
# Description: Displays a welcome screen with system info and
#              the open-source license that governs the OS.
# =============================================================

# --- Student Info Variables ---
STUDENT_NAME="[Your Name]"        # TODO: Replace with your name
ROLL_NUMBER="[Your Roll Number]"  # TODO: Replace with your roll number
SOFTWARE_CHOICE="Git"

# --- Collect System Information using command substitution ---
KERNEL=$(uname -r)                         # Kernel version
DISTRO=$(cat /etc/os-release | grep "^PRETTY_NAME" | cut -d= -f2 | tr -d '"')  # Distro name
USER_NAME=$(whoami)                        # Current logged-in user
HOME_DIR=$HOME                             # Home directory of current user
UPTIME=$(uptime -p)                        # Human-readable uptime
CURRENT_DATE=$(date '+%A, %d %B %Y')       # e.g. Monday, 25 March 2026
CURRENT_TIME=$(date '+%I:%M %p')           # e.g. 10:30 AM
OS_LICENSE="GNU General Public License v2 (GPL-2.0)"  # Linux kernel license

# --- Display the identity report ---
echo "================================================================"
echo "         OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT            "
echo "================================================================"
echo ""
echo "  Student Name   : $STUDENT_NAME"
echo "  Roll Number    : $ROLL_NUMBER"
echo "  Audited OSS    : $SOFTWARE_CHOICE"
echo ""
echo "----------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "----------------------------------------------------------------"
echo "  Distribution   : $DISTRO"
echo "  Kernel Version : $KERNEL"
echo "  Logged-in User : $USER_NAME"
echo "  Home Directory : $HOME_DIR"
echo "  System Uptime  : $UPTIME"
echo "  Date           : $CURRENT_DATE"
echo "  Time           : $CURRENT_TIME"
echo ""
echo "----------------------------------------------------------------"
echo "  OPEN SOURCE LICENSE"
echo "----------------------------------------------------------------"
echo "  This operating system (Linux Kernel) is covered under:"
echo "  $OS_LICENSE"
echo ""
echo "  This means: You are FREE to run, study, share, and modify"
echo "  this software — as long as you keep those same freedoms"
echo "  intact for others (copyleft principle)."
echo ""
echo "================================================================"
echo "  Git is also licensed under GPL-2.0 — the same freedom"
echo "  that Linus Torvalds chose when Linux couldn't use BitKeeper."
echo "================================================================"
