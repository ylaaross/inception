#!/bin/bash

# Determine the correct user's home directory
if [ "$(id -u)" -eq 0 ]; then
    HOME_DIR="/home/${SUDO_USER}"
else
    HOME_DIR="/home/${USER}"
fi

# Ensure directories exist
[ ! -d "${HOME_DIR}/data" ] && mkdir "${HOME_DIR}/data" && chmod 777 "${HOME_DIR}/data"
[ ! -d "${HOME_DIR}/data/mariadb" ] && mkdir "${HOME_DIR}/data/mariadb" && chmod 777 "${HOME_DIR}/data/mariadb"
[ ! -d "${HOME_DIR}/data/wordpress" ] && mkdir "${HOME_DIR}/data/wordpress" && chmod 777 "${HOME_DIR}/data/wordpress"

exit 0
