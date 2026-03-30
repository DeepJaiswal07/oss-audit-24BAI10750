# OSS Audit — Git
### Open Source Software Capstone Project | VITyarthi

| Field | Details |
|-------|---------|
| **Student Name** | Deep Jaiswal |
| **Roll Number** | 24BAI10750 |
| **Chosen Software** | Git |
| **License** | GNU General Public License v2 (GPL-2.0) |
| **Course** | Open Source Software (OSS NGMC) |

---

## About the Chosen Software — Git

**Git** is a free and open-source distributed version control system created by **Linus Torvalds** in 2005. It was built in response to a licensing dispute with BitKeeper, the proprietary VCS previously used for Linux kernel development. In just two weeks, Torvalds wrote Git from scratch and licensed it under GPL-2.0 — ensuring no proprietary tool could ever hold the Linux project hostage again.

Today, Git is the backbone of nearly all modern software development, powering platforms like GitHub, GitLab, and Bitbucket.

---

## Repository Structure

```
oss-audit-[rollnumber]/
│
├── script1_system_identity.sh       # System info welcome screen
├── script2_package_inspector.sh     # FOSS package checker with case statement
├── script3_disk_permission_auditor.sh  # Directory permissions & disk usage
├── script4_log_analyzer.sh          # Log file keyword counter & analyzer
├── script5_manifesto_generator.sh   # Interactive open source manifesto generator
│
└── README.md                        # This file
```

---

## Script Descriptions

### Script 1 — System Identity Report
Displays a formatted welcome screen showing the Linux distribution, kernel version, logged-in user, home directory, system uptime, current date/time, and the open-source license covering the OS.

**Key concepts:** Variables, `echo`, command substitution `$()`, output formatting.

---

### Script 2 — FOSS Package Inspector
Checks whether Git (or any chosen package) is installed on the system. Handles both RPM-based and Debian-based Linux systems. Uses a `case` statement to print a philosophy note about the package.

**Key concepts:** `if-then-else`, `case` statement, `rpm -qi` / `dpkg -s`, pipe with `grep`.

---

### Script 3 — Disk and Permission Auditor
Loops through a predefined list of important system directories and reports each directory's permissions, owner, group, and disk usage. Also specifically checks Git's config file locations.

**Key concepts:** `for` loop, arrays, `ls -ld`, `du -sh`, `awk`, `cut`.

---

### Script 4 — Log File Analyzer
Reads a log file line by line and counts how many lines contain a given keyword. Includes a retry mechanism if the file is empty, and prints the last 5 matching lines.

**Key concepts:** `while read` loop, `if-then`, counter variables, command-line arguments `$1 $2`, `grep`, `tail`.

**Usage:**
```bash
./script4_log_analyzer.sh /var/log/syslog error
./script4_log_analyzer.sh /var/log/messages WARNING
```

---

### Script 5 — Open Source Manifesto Generator
Interactively asks the user three questions and generates a personalised open source philosophy statement, saved to a `.txt` file named after the current user.

**Key concepts:** `read` for user input, string concatenation, writing to file with `>` and `>>`, `date` command, alias concept demonstrated via a function.

---

## How to Run the Scripts on Linux

### Step 1 — Clone the Repository
```bash
git clone https://github.com/[your-username]/oss-audit-[rollnumber].git
cd oss-audit-[rollnumber]
```

### Step 2 — Make Scripts Executable
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_permission_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

### Step 3 — Run Each Script

```bash
# Script 1: System Identity
./script1_system_identity.sh

# Script 2: Package Inspector
./script2_package_inspector.sh

# Script 3: Disk & Permission Auditor
./script3_disk_permission_auditor.sh

# Script 4: Log Analyzer (provide a log file path)
./script4_log_analyzer.sh /var/log/syslog error
# or (if syslog doesn't exist on your system)
./script4_log_analyzer.sh /var/log/messages warning

# Script 5: Manifesto Generator (interactive)
./script5_manifesto_generator.sh
```

---

## Dependencies

| Dependency | Purpose | Install Command |
|-----------|---------|----------------|
| `bash` | Shell interpreter | Pre-installed on all Linux systems |
| `git` | Audited software | `sudo apt install git` / `sudo dnf install git` |
| `rpm` or `dpkg` | Package inspection (Script 2) | Pre-installed on respective distros |
| `awk`, `cut`, `grep` | Text processing | Pre-installed (GNU coreutils) |
| `du`, `df`, `ls` | Disk & file utilities | Pre-installed (GNU coreutils) |

> All scripts are written for **bash** and tested on Ubuntu/Fedora Linux. They require no third-party installations beyond Git itself.

---

## System Requirements

(i) Linux (Ubuntu 20.04+ / Fedora 35+ / any modern distro)/
(ii) Bash 4.0 or higher/
(iii) Git installed (for Script 2 to show package details)/
(iv) Read access to `/var/log/` (for Script 4)

---

## Academic Integrity Note

All shell scripts in this repository were written, tested, and understood by the student. The report submitted separately contains original analysis and personal reflection, not AI-generated content.

---

*Capstone Project | Open Source Software Course | VITyarthi*
