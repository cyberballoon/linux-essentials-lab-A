# linux-essentials-lab-A
User Management
This repository contains my completed Linux Essentials lab work focused on user and group management, permissions, and secure directory setup for a company’s newly created departments.

## Lab Overview

The lab’s objective was to configure a Linux server with:

- Department directories (`/Engineering`, `/Sales`, `/IS`)
- Corresponding user groups for each department
- Administrative and regular users assigned to their respective groups
- Proper ownership and permissions on directories and files to ensure security and confidentiality

## Key Tasks Performed

- Created groups and users with Bash login shells
- Assigned primary groups to users according to their departments
- Set directory ownership to department administrators and group ownership to department groups
- Configured permissions so:
  - Only department members can access their directories
  - Only the owner of a file can delete it (using sticky bit)
  - Department administrators have full access, and regular users have read/write/execute access within their directories
- Created confidential files within each department directory with restricted access
- Verified all configurations using Linux commands like `getent`, `id`, `ls`, and `cat`

## Skills Practiced

- User and group management (`useradd`, `groupadd`, `usermod`)
- File and directory permissions (`chmod`, `chown`, sticky bit)
- Bash scripting and command line operations
- Linux system security best practices

---

*This lab was completed as part of my Cisco Linux Essentials course.*
