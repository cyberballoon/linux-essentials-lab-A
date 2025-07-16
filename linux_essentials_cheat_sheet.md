
# 🐧 Linux Essentials Lab – Command Cheat Sheet

## 🧱 1. Create Groups (one per department)

```bash
sudo groupadd engineering
sudo groupadd sales
sudo groupadd is
```

## 👥 2. Create Users (admin + 2 users per department)

### Engineering:
```bash
sudo useradd -m -s /bin/bash -g engineering eng_admin
sudo useradd -m -s /bin/bash -g engineering eng_user1
sudo useradd -m -s /bin/bash -g engineering eng_user2
```

### Sales:
```bash
sudo useradd -m -s /bin/bash -g sales sales_admin
sudo useradd -m -s /bin/bash -g sales sales_user1
sudo useradd -m -s /bin/bash -g sales sales_user2
```

### IS:
```bash
sudo useradd -m -s /bin/bash -g is is_admin
sudo useradd -m -s /bin/bash -g is is_user1
sudo useradd -m -s /bin/bash -g is is_user2
```

> 🧠 `-m`: creates home directory  
> 🧠 `-s /bin/bash`: sets login shell  
> 🧠 `-g`: sets primary group

## 📂 3. Create Department Folders

```bash
sudo mkdir /Engineering /Sales /IS
```

## 👑 4. Set Folder Ownership & Permissions

### Engineering:
```bash
sudo chown eng_admin:engineering /Engineering
sudo chmod 770 /Engineering
sudo chmod +t /Engineering
```

### Sales:
```bash
sudo chown sales_admin:sales /Sales
sudo chmod 770 /Sales
sudo chmod +t /Sales
```

### IS:
```bash
sudo chown is_admin:is /IS
sudo chmod 770 /IS
sudo chmod +t /IS
```

> 🔐 `chmod 770`: full access for owner and group  
> 📛 `+t` sticky bit: only file owner can delete

## 📝 5. Create Confidential File

### Engineering:
```bash
echo "This file contains confidential information for the department." | sudo tee /Engineering/confidential.txt
sudo chown eng_admin:engineering /Engineering/confidential.txt
sudo chmod 640 /Engineering/confidential.txt
```

### Sales & IS:
Repeat with appropriate usernames and paths.

> 📄 `chmod 640`: owner read/write, group read, others no access  
> ❌ No `x` because it's a document, not a script

## 🧪 6. Verify Users, Groups, and Permissions

### Users:
```bash
getent passwd eng_admin eng_user1 eng_user2
```

### Groups:
```bash
getent group engineering sales is
```

### Group Membership:
```bash
id sales_user2
```

### Directory & File Permissions:
```bash
ls -ld /Engineering /Sales /IS
ls -l /Engineering/confidential.txt
```

### View File Contents:
```bash
sudo cat /Engineering/confidential.txt
```

## 📌 Quick Permission Reference

| Value | Meaning |
|-------|---------|
| 7     | read + write + execute (rwx) |
| 6     | read + write (rw-)           |
| 4     | read only (r--)              |
| 0     | no access (---)              |
