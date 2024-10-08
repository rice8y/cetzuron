#!/bin/bash

if ! command -v typst &> /dev/null; then
  echo "Error: Typst is not installed. Please install it before running this script."
  exit 1
fi

TOML_FILE="typst.toml"

get_value_from_toml() {
  local key="$1"
  grep "$key" "$TOML_FILE" | sed -E 's/.*= "(.*)"/\1/' | tr -d '\r'
}

get_local_package_dir() {
  if [[ "$OSTYPE" == "linux-gnu"* || "$OSTYPE" == "darwin"* ]]; then
    # Linux, macOS
    local data_home="${XDG_DATA_HOME:-$HOME/.local/share}"
    echo "$data_home/typst/packages"
  elif [[ "$OSTYPE" == "msys"* || "$OSTYPE" == "cygwin"* ]]; then
    # Windows
    echo "$APPDATA/typst/packages"
  else
    echo "Unsupported OS"
    exit 1
  fi
}

PACKAGE_NAME=$(get_value_from_toml "name")
PACKAGE_VERSION=$(get_value_from_toml "version")

LOCAL_PACKAGE_DIR=$(get_local_package_dir)
TARGET_DIR="$LOCAL_PACKAGE_DIR/local/$PACKAGE_NAME/$PACKAGE_VERSION"

mkdir -p "$TARGET_DIR"
cp -r ./* "$TARGET_DIR"

echo "Package $PACKAGE_NAME version $PACKAGE_VERSION has been installed to $TARGET_DIR"
