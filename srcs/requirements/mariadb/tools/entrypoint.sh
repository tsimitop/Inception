#!/bin/bash
set -e

# Run the initialization script
/etc/mysql/db_script.sh

# Start MariaDB
mysqld