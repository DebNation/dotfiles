#!/usr/bin/env bash
set -e

APP_NAME="Helium Browser"
APP_ID="helium-browser"
ICON_URL="https://raw.githubusercontent.com/imputnet/helium/main/resources/branding/app_icon/raw.png"

if [[ -z "$1" ]]; then
  echo "Usage: $0 /path/to/helium.appimage"
  exit 1
fi

SOURCE_APPIMAGE="$1"
INSTALL_DIR="$HOME/.local/bin"
DESKTOP_DIR="$HOME/.local/share/applications"
ICON_DIR="$HOME/.local/share/icons"

APPIMAGE_PATH="$INSTALL_DIR/${APP_ID}.AppImage"
DESKTOP_FILE="$DESKTOP_DIR/${APP_ID}.desktop"
ICON_PATH="$ICON_DIR/${APP_ID}.png"

mkdir -p "$INSTALL_DIR" "$DESKTOP_DIR" "$ICON_DIR"

echo "📦 Installing $APP_NAME..."
cp "$SOURCE_APPIMAGE" "$APPIMAGE_PATH"
chmod +x "$APPIMAGE_PATH"

echo "🖼️  Downloading icon…"
curl -fsSL "$ICON_URL" -o "$ICON_PATH" || echo "⚠️  Could not download icon, using default."

echo "🧩  Creating desktop entry…"
cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Name=$APP_NAME
Exec=$APPIMAGE_PATH
Icon=$ICON_PATH
Type=Application
Categories=Network;WebBrowser;
Terminal=false
EOF

chmod +x "$DESKTOP_FILE"

echo "✅ Installed $APP_NAME!"
echo "You can now launch it from your applications menu."
