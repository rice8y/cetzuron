TOML_FILE := "typst.toml"

get_value_from_toml key:
  #!/bin/bash
  grep "{{key}}" {{TOML_FILE}} | sed -E 's/.*= "(.*)"/\1/'

get_local_package_dir:
  #!/bin/bash
  if [[ "$OSTYPE" == "linux-gnu"* || "$OSTYPE" == "darwin"* ]]; then
    echo "${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages"
  elif [[ "$OSTYPE" == "msys"* || "$OSTYPE" == "cygwin"* ]]; then
    echo "$APPDATA/typst/packages"
  else
    echo "Unsupported OS"
    exit 1
  fi

install:
  #!/bin/bash
  if ! command -v typst &> /dev/null; then
    echo "Error: Typst is not installed. Please install it before running this recipe."
    exit 1
  fi
  PACKAGE_NAME=$(just get_value_from_toml name)
  PACKAGE_VERSION=$(just get_value_from_toml version)
  LOCAL_PACKAGE_DIR=$(just get_local_package_dir)
  TARGET_DIR="$LOCAL_PACKAGE_DIR/local/$PACKAGE_NAME/$PACKAGE_VERSION"
  mkdir -p "$TARGET_DIR"
  cp -r ./* "$TARGET_DIR"
  echo "Package $PACKAGE_NAME version $PACKAGE_VERSION has been installed to $TARGET_DIR"

clean:
  #!/bin/bash
  if ! command -v typst &> /dev/null; then
    echo "Error: Typst is not installed. Please install it before running this recipe."
    exit 1
  fi
  PACKAGE_NAME=$(just get_value_from_toml name)
  PACKAGE_VERSION=$(just get_value_from_toml version)
  LOCAL_PACKAGE_DIR=$(just get_local_package_dir)
  TARGET_DIR="$LOCAL_PACKAGE_DIR/local/$PACKAGE_NAME/$PACKAGE_VERSION"
  
  if [ -d "$TARGET_DIR" ]; then
    rm -rf "$TARGET_DIR"
    echo "Directory $TARGET_DIR has been removed."
  else
    echo "Directory $TARGET_DIR does not exist."
  fi
