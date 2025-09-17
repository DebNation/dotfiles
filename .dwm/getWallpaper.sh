
#!/bin/bash

SAVE_DIR="$HOME/Wallhaven_Wallpapers"
mkdir -p "$SAVE_DIR"

response=$(curl "https://wallhaven.cc/api/v1/search?apikey=apiKey&categories=010&sorting=random&purity=100")

wallpaper_url=$(echo "$response" | jq -r '.data[0].path')
if [[ -n "$wallpaper_url" ]]; then
        wget -q -P "$SAVE_DIR" "$wallpaper_url"
        echo "Downloaded wallpaper to $SAVE_DIR"
        filename=$(basename "$wallpaper_url")
        nitrogen --set-zoom-fill $SAVE_DIR/$filename --save
        dunstify "Wallpaper Changed"
        exit 0
fi
