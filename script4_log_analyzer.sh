#!/bin/bash
# =============================================================
# Script 4: Log File Analyzer
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | Chosen Software: Git
# Description: Reads a log file line by line, counts occurrences
#              of a keyword, and shows the last 5 matching lines.
#              Accepts log file path and keyword as arguments.
# Usage: ./script4_log_analyzer.sh /var/log/syslog error
#        ./script4_log_analyzer.sh /var/log/messages WARNING
# =============================================================

# --- Accept command-line arguments ---
LOGFILE=$1                   # First argument: path to log file
KEYWORD=${2:-"error"}        # Second argument: keyword (default: "error")
COUNT=0                      # Counter variable for keyword matches
MAX_RETRIES=3                # Max retries if file is empty

echo "================================================================"
echo "         LOG FILE ANALYZER"
echo "================================================================"
echo ""

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "  Usage: $0 <logfile> [keyword]"
    echo "  Example: $0 /var/log/syslog error"
    echo ""
    # If no argument, try a default log file automatically
    if [ -f "/var/log/syslog" ]; then
        LOGFILE="/var/log/syslog"
        echo "  No file specified. Using default: $LOGFILE"
    elif [ -f "/var/log/messages" ]; then
        LOGFILE="/var/log/messages"
        echo "  No file specified. Using default: $LOGFILE"
    else
        echo "  No log file found. Exiting."
        exit 1
    fi
fi

# --- Check if the log file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "  Error: File '$LOGFILE' not found."
    echo "  Please provide a valid log file path."
    exit 1
fi

echo "  Log File : $LOGFILE"
echo "  Keyword  : '$KEYWORD' (case-insensitive)"
echo ""

# --- Do-while style retry if file is empty ---
ATTEMPT=1
while [ $ATTEMPT -le $MAX_RETRIES ]; do
    # Check if file is empty
    if [ ! -s "$LOGFILE" ]; then
        echo "  [Attempt $ATTEMPT/$MAX_RETRIES] File is empty. Retrying in 2 seconds..."
        sleep 2
        ATTEMPT=$((ATTEMPT + 1))
    else
        # File has content — break out of retry loop
        break
    fi
done

# --- Final check after retries ---
if [ ! -s "$LOGFILE" ]; then
    echo "  File is still empty after $MAX_RETRIES attempts. Exiting."
    exit 1
fi

echo "  Scanning log file..."
echo "  ----------------------------------------------------------------"

# --- While-read loop: read the log file line by line ---
while IFS= read -r LINE; do
    # If-then inside the loop: check if line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter
    fi
done < "$LOGFILE"   # Redirect file content into the while loop

echo ""
echo "  RESULT: Keyword '$KEYWORD' found $COUNT time(s) in:"
echo "  $LOGFILE"
echo ""

# --- Show last 5 matching lines using grep and tail ---
echo "  ----------------------------------------------------------------"
echo "  LAST 5 LINES CONTAINING '$KEYWORD':"
echo "  ----------------------------------------------------------------"

MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)

if [ -z "$MATCHES" ]; then
    echo "  (No matching lines found)"
else
    # Print each match with a line prefix for readability
    echo "$MATCHES" | while IFS= read -r MATCH_LINE; do
        echo "  >> $MATCH_LINE"
    done
fi

echo ""
echo "================================================================"
echo "  Open Source Note: Git uses structured log formats internally."
echo "  'git log' is essentially a log analyzer — it lets every"
echo "  contributor inspect the full history of a project freely."
echo "================================================================"
