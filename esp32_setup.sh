#!/bin/bash

ENDCOLOR="\e[0m"
RED="\e[31m"

handle_error() {
  echo -e "${RED}Error: $1${ENDCOLOR}"
  exit 1
}

# Export the ESP-IDF environment
. "$HOME/esp/esp-idf/export.sh" || handle_error "Failed to source ESP-IDF environment. Please check your installation."
echo "ESP-IDF environment variables exported successfully."

# Build the project
idf.py build || handle_error "Failed to build the project. Please check your project configuration."
echo "Project built successfully."

# Flash the project
idf.py flash || handle_error "Failed to flash the project. Please check your connection."
echo -e "Project flashed successfully."

# Monitor the project
idf.py monitor || handle_error "Failed to start monitor."

