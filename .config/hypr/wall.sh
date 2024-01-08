
# Specify the path to the folder containing images
image_folder=~/.config/hypr/walls

# Check if the folder exists
if [ ! -d "$image_folder" ]; then
    echo "Error: The specified folder does not exist."
    exit 1
fi

# Get a list of all image files in the folder
image_files=("$image_folder"/*.{jpg,jpeg,png})

# Check if there are any image files in the folder
if [ ${#image_files[@]} -eq 0 ]; then
    echo "Error: No image files found in the specified folder."
    exit 1
fi

# Get the number of image files
num_images=${#image_files[@]}

# Generate a random index to pick a random image
random_index=$((RANDOM % num_images))

# Get the randomly selected image file
random_image="${image_files[random_index]}"

# Display the path to the randomly selected image
echo "Randomly selected image: $random_image"
hyprctl hyprpaper wallpaper "eDP-1,~/.config/hypr/walls/$random_image"
# Now you can use the variable $random_image in your script as needed
# For example, you can use it to copy, move, or display the image
# Uncomment the following line if you want to open the image automatically
# eog "$random_image"  # Replace 'eog' with the appropriate image viewer command

exit 0
