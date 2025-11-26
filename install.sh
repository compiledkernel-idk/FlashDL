#!/bin/bash
set -e

REPO="compiledkernel-idk/FlashDL"
INSTALL_DIR="/usr/local/bin"
BINARY_NAME="flashdl"

echo "Fetching latest release version..."
LATEST_RELEASE=$(curl -s https://api.github.com/repos/$REPO/releases/latest | grep "tag_name" | cut -d '"' -f 4)

if [ -z "$LATEST_RELEASE" ]; then
  echo "Error: Could not determine latest release."
  exit 1
fi

echo "Downloading FlashDL $LATEST_RELEASE..."
DOWNLOAD_URL="https://github.com/$REPO/releases/download/$LATEST_RELEASE/FlashDL-linux.tar.gz"
curl -L -o FlashDL-linux.tar.gz "$DOWNLOAD_URL"

echo "Extracting..."
tar -xzf FlashDL-linux.tar.gz

echo "Installing to $INSTALL_DIR..."
if [ -w "$INSTALL_DIR" ]; then
  mv FlashDL-linux/$BINARY_NAME "$INSTALL_DIR/"
else
  sudo mv FlashDL-linux/$BINARY_NAME "$INSTALL_DIR/"
fi

# Cleanup
rm -rf FlashDL-linux FlashDL-linux.tar.gz

echo "Success! FlashDL installed to $INSTALL_DIR/$BINARY_NAME"
echo "Run it with: $BINARY_NAME [URL]"
