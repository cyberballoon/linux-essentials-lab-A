#!/bin/bash

# ===== CREATE GROUPS =====
sudo groupadd engineering
sudo groupadd sales
sudo groupadd is

# ===== CREATE USERS =====
# Engineering
sudo useradd -m -s /bin/bash -g engineering eng_admin
sudo useradd -m -s /bin/bash -g engineering eng_user1
sudo useradd -m -s /bin/bash -g engineering eng_user2

# Sales
sudo useradd -m -s /bin/bash -g sales sales_admin
sudo useradd -m -s /bin/bash -g sales sales_user1
sudo useradd -m -s /bin/bash -g sales sales_user2

# IS
sudo useradd -m -s /bin/bash -g is is_admin
sudo useradd -m -s /bin/bash -g is is_user1
sudo useradd -m -s /bin/bash -g is is_user2

# ===== CREATE DEPARTMENT DIRECTORIES =====
sudo mkdir /Engineering /Sales /IS

# ===== SET OWNERSHIP & PERMISSIONS ON FOLDERS =====
sudo chown eng_admin:engineering /Engineering
sudo chmod 770 /Engineering
sudo chmod +t /Engineering

sudo chown sales_admin:sales /Sales
sudo chmod 770 /Sales
sudo chmod +t /Sales

sudo chown is_admin:is /IS
sudo chmod 770 /IS
sudo chmod +t /IS

# ===== CREATE CONFIDENTIAL FILES =====
echo "This file contains confidential information for the department." | sudo tee /Engineering/confidential.txt
sudo chown eng_admin:engineering /Engineering/confidential.txt
sudo chmod 640 /Engineering/confidential.txt

echo "This file contains confidential information for the department." | sudo tee /Sales/confidential.txt
sudo chown sales_admin:sales /Sales/confidential.txt
sudo chmod 640 /Sales/confidential.txt

echo "This file contains confidential information for the department." | sudo tee /IS/confidential.txt
sudo chown is_admin:is /IS/confidential.txt
sudo chmod 640 /IS/confidential.txt

# ===== VERIFICATION =====
getent passwd eng_admin eng_user1 eng_user2
getent passwd sales_admin sales_user1 sales_user2
getent passwd is_admin is_user1 is_user2

getent group engineering
getent group sales
getent group is

id eng_user1
id sales_admin
id is_user2

ls -ld /Engineering /Sales /IS
ls -l /Engineering/confidential.txt
ls -l /Sales/confidential.txt
ls -l /IS/confidential.txt

sudo cat /Engineering/confidential.txt
sudo cat /Sales/confidential.txt
sudo cat /IS/confidential.txt
