#!/bin/bash
# =============================================================
# Script 5: Open Source Manifesto Generator
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | Chosen Software: Git
# Description: Interactively asks the user 3 questions and
#              generates a personalised open source philosophy
#              statement, saved to a .txt file.
# =============================================================

# --- Alias concept demonstration ---
# In a real shell session you might use: alias today='date +%d\ %B\ %Y'
# Here we show the concept via a function (aliases don't export to scripts)
get_today() {
    date '+%d %B %Y'   # Returns formatted date e.g. 25 March 2026
}

# --- Welcome banner ---
echo "================================================================"
echo "         OPEN SOURCE MANIFESTO GENERATOR"
echo "         Powered by: Git (GPL-2.0) on Linux"
echo "================================================================"
echo ""
echo "  Answer three questions to generate your personal open source"
echo "  philosophy statement. It will be saved to a .txt file."
echo ""
echo "----------------------------------------------------------------"

# --- Read user input interactively ---
# read -p displays a prompt and stores input in a variable

read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""

read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
echo ""

read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""

# --- Capture metadata ---
DATE=$(get_today)
AUTHOR=$(whoami)
OUTPUT="manifesto_${AUTHOR}.txt"  # Output filename includes username

echo "----------------------------------------------------------------"
echo "  Generating your manifesto..."
echo ""

# --- String concatenation: compose the manifesto paragraph ---
# Using echo with >> to append each line to the output file
# Using > first to create/overwrite, then >> to append

echo "================================================================" > "$OUTPUT"
echo "  MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "  By: $AUTHOR | Date: $DATE" >> "$OUTPUT"
echo "================================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Main manifesto paragraph built from user's answers ---
echo "  Every day, I rely on $TOOL — a tool that exists not because" >> "$OUTPUT"
echo "  someone wanted to profit from it, but because someone chose" >> "$OUTPUT"
echo "  to share it. To me, freedom means $FREEDOM. That single word" >> "$OUTPUT"
echo "  is why open source matters: software built openly gives every" >> "$OUTPUT"
echo "  person the freedom to learn, adapt, and improve it without" >> "$OUTPUT"
echo "  asking permission." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  The tool I would build and share freely is: $BUILD." >> "$OUTPUT"
echo "  By sharing it under an open license, I would be doing what" >> "$OUTPUT"
echo "  Linus Torvalds did with Git — turning a personal frustration" >> "$OUTPUT"
echo "  into a gift that outlasts any single person or company." >> "$OUTPUT"
echo "  Standing on the shoulders of giants means inheriting their" >> "$OUTPUT"
echo "  generosity. I choose to pass it forward." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Signed: $AUTHOR" >> "$OUTPUT"
echo "  Date  : $DATE" >> "$OUTPUT"
echo "  Tool  : $TOOL | Freedom: $FREEDOM | Build: $BUILD" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "================================================================" >> "$OUTPUT"

# --- Confirm save and display contents ---
echo "  [SAVED] Manifesto written to: $OUTPUT"
echo ""
echo "  ---- YOUR MANIFESTO ----"
echo ""

# cat to display the saved file contents
cat "$OUTPUT"

echo ""
echo "================================================================"
echo "  This manifesto was generated on a system running open-source"
echo "  software. Git, Bash, and Linux — all free, all GPL-licensed."
echo "================================================================"
