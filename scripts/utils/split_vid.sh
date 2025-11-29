#!/bin/bash
INPUT="$1"
MAX_MB=1800

if [ -z "$INPUT" ]; then
    echo "Usage: $0 <input.mp4>"
    exit 1
fi

BASENAME=$(basename "$INPUT")
NAME="${BASENAME%.*}"

FILE_MB=$(du -m "$INPUT" | awk '{print $1}')
echo "File size: ${FILE_MB}MB"

if [ "$FILE_MB" -le "$MAX_MB" ]; then
    echo "🔹 File is below ${MAX_MB}MB. No splitting needed."
    cp "$INPUT" "${NAME}_part01.mp4"
    echo "✔ Output: ${NAME}_part01.mp4"
    exit 0
fi

# Get video duration in seconds
DURATION=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$INPUT")

if [ -z "$DURATION" ]; then
    echo "❌ Could not determine video duration"
    exit 1
fi

# Calculate chunk duration using awk
CHUNK_DURATION=$(awk "BEGIN {printf \"%.2f\", $DURATION * $MAX_MB / $FILE_MB}")

echo "🔹 Splitting video into ~${MAX_MB}MB chunks (~${CHUNK_DURATION}s each)..."
echo "Total duration: ${DURATION}s"

# Split using ffmpeg - only copy video and audio streams (exclude data streams)
ffmpeg -i "$INPUT" -map 0:v -map 0:a -c copy -f segment -segment_time "$CHUNK_DURATION" -reset_timestamps 1 "${NAME}_part%02d.mp4" -y

COUNT=$(ls ${NAME}_part*.mp4 2>/dev/null | wc -l)
echo "✔ Done! Created $COUNT files."
