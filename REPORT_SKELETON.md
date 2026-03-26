# THE OPEN SOURCE AUDIT — REPORT SKELETON
## Chosen Software: Git | Student: [Your Name] | Roll: [Your Roll Number]
---
> ⚠️  THIS IS A WRITING SKELETON — NOT A FINISHED REPORT.
> Every section marked [WRITE HERE] must be filled in YOUR OWN WORDS.
> The questions in brackets are prompts to guide your thinking.
> Do NOT copy this structure as-is into your submission.
---

# Introduction
[WRITE HERE — 1 paragraph]
Introduce what this report is about. What is Git? Why did you choose it?
What will a reader learn by reading your audit?

---

# PART A — Origin and Philosophy

## A1. The Problem Git Was Created to Solve
[WRITE HERE — at least 2 pages]

Guiding questions to research and answer in your own words:
- What was Linus Torvalds using before Git? (Hint: BitKeeper)
- What happened in April 2005 that forced Torvalds to act?
- What specific frustrations with existing VCS tools (CVS, SVN) did developers face?
- Why did Torvalds choose to build Git in TWO WEEKS — what drove that urgency?
- Why did he license it under GPL-2.0 specifically? What does that license choice say about his values?
- Quote (in your own words, not copied) what Torvalds has said about why he built Git.

Research starting points:
- Linus Torvalds' 2007 Google Tech Talk on Git (YouTube)
- git-scm.com/book/en/v2/Getting-Started-A-Short-History-of-Git
- The Linux kernel mailing list archives from April 2005

---

## A2. The License — What It Actually Says
[WRITE HERE — at least 1.5 pages]

First: Go to https://git-scm.com and find the actual GPL-2.0 license text.
Read it. Then answer these in your own words:

1. What are the four freedoms of free software?
   - Freedom 0: [explain in your own words]
   - Freedom 1: [explain in your own words]
   - Freedom 2: [explain in your own words]
   - Freedom 3: [explain in your own words]
   Does Git's GPL-2.0 license grant all four? [yes/no and why]

2. Can a company take Git's source code, modify it, and sell it as a proprietary product
   without sharing their changes? [Answer: No — explain WHY based on copyleft]

3. What is the difference between GPL and MIT licensing?
   [Think about: what does GPL require that MIT does not?]
   Which would YOU choose for a project you built, and why?

4. "Free as in free beer" vs "free as in freedom" — what is the difference?
   Give a concrete example using Git. (Hint: GitHub is free to use but not open source.
   Git itself is free AND open. How are these different?)

---

## A3. The Ethics of Open Source
[WRITE HERE — at least 1 page]

These are opinion questions. There is NO correct answer. Write YOUR genuine view.

1. Should all software be open source?
   Argument FOR: [your thinking]
   Argument AGAINST: [your thinking]
   Your conclusion: [what do YOU believe, and why?]

2. Is it ethical for a company to build a profitable product entirely on top of
   free community labor?
   Think about: Microsoft owns GitHub (built on Git). Google uses Linux heavily.
   They profit enormously. The community got nothing financially.
   Is this fair? What do you think?

3. What does "standing on the shoulders of giants" mean in software?
   Does open source enable original innovation, or does it make it harder
   to be truly original? Use Git as your example.

---

# PART B — Linux Footprint

[WRITE HERE — include actual screenshots from YOUR Linux system]

Complete this section by actually running these commands on Linux
and documenting what you see:

## Installation
- What command did you use to install Git?
  (e.g., sudo apt install git  OR  sudo dnf install git)
- Is it available via apt/dnf/rpm? Does it need to be compiled from source?

## Key Directories
Run these commands and document the output:
```
which git              # Where is the binary?
git --version          # What version is installed?
ls -la /usr/bin/git    # Permissions on the binary
ls ~/.gitconfig        # Does a user config exist?
cat /etc/gitconfig     # System-wide config (may need sudo)
```

Document: Where are Git's binaries? Config files? Any logs?

## User and Group
- What user does Git run as? (It runs as the CURRENT user — why is this important?)
- How does this compare to a server daemon like Apache that runs as www-data?
- Why does running as a specific user matter for security?

## Service Management
Git is not a daemon/service — it runs on demand. Document this difference:
- How is Git different from Apache (which runs as a background service)?
- What commands would you use to run git as a service? (Hint: git daemon)
- Show the command: systemctl status git  — what does it say?

## Update Model
- How do you update Git on your system? (apt upgrade / dnf upgrade)
- Who decides when a new version is released? (The Git community — git-scm.com)
- How quickly do security patches reach your machine through the package manager?

---

# PART C — The FOSS Ecosystem

[WRITE HERE]

## Dependencies
What does Git depend on? Research and document:
- OpenSSL (for HTTPS connections)
- libcurl (for remote operations)
- zlib (for compression)
- Perl (for some Git utilities)
- SSH (for git@github.com connections)

## What Git Has Enabled
- GitHub (founded 2008) — what would GitHub be without Git?
- GitLab — an open-source alternative to GitHub
- Gitea — a lightweight self-hosted option
- CI/CD tools: Jenkins, GitHub Actions, GitLab CI — all built on Git
- Linux kernel development itself — Git's original purpose

## Git and the Web / LAMP Stack
- How does Git relate to web development workflows?
- How do developers deploy web apps using Git? (git push to deploy)
- Is Git part of the LAMP stack? Why or why not?

## Community and Governance
- Who maintains Git today? (Junio C Hamano has been the maintainer since 2005)
- Where do contributors submit patches? (The git mailing list — not GitHub PRs!)
- Where are discussions held? (git@vger.kernel.org mailing list)
- Are there Git conferences? (Git Merge conference — research it)

---

# PART D — Open Source vs Proprietary

[FILL IN THIS TABLE IN YOUR REPORT, then write 2 paragraphs below it]

| Dimension | Git (Open Source) | SVN/Perforce (Proprietary) |
|-----------|-------------------|---------------------------|
| Cost | [fill in] | [fill in] |
| Security (code auditing) | [fill in] | [fill in] |
| Support and reliability | [fill in] | [fill in] |
| Freedom to modify | [fill in] | [fill in] |
| Community vs corporate control | [fill in] | [fill in] |
| Your overall verdict | [fill in] | [fill in] |

[WRITE 2 PARAGRAPHS:]
Paragraph 1: Based on your analysis, would you recommend Git for real-world deployment?
Be specific — what kind of project/team? Are there any cases where you'd choose SVN or
a proprietary tool instead?

Paragraph 2: Would you contribute to Git? Why or why not? What would it take?
(Look up: how does someone actually submit a patch to Git? — it's via email, not a PR)

---

# Conclusion
[WRITE HERE — 1 paragraph]
Summarize what you learned from this audit. How has your view of Git (or open source
in general) changed? What is one thing that surprised you?

---

# References
[List your actual sources here — websites, books, videos you used]

Format:
1. Author/Organization. "Title." URL. Accessed [date].

Example:
1. Torvalds, Linus. "Tech Talk: Linus Torvalds on Git." Google, 2007.
   https://www.youtube.com/watch?v=4XpnKHJAok8

Do NOT list sources you did not actually read.
