#check if writefile and writestr are provided
if [ "$#" -lt 2 ]; then
    echo "Error: writefile and writestr are required." >&2
    echo "Usage: $0 <writefile> <writestr>" >&2
    exit 1
fi

#set variables for the arguments
WRITEFILE=$1
WRITESTR=$2
WRITE_DIR=$(dirname "$WRITEFILE")

#check if the directory for writefile exists, if not create it
if ! mkdir -p "$WRITE_DIR"; then
    echo "Error: Could not create directory for $WRITEFILE" >&2
    exit 1
fi

#attempt to write the writestr to the writefile, if it fails, print an error message and exit with a non-zero status
if ! printf '%s' "$WRITESTR" > "$WRITEFILE"; then
    echo "Error: Could not create or write to $WRITEFILE" >&2
    exit 1
fi