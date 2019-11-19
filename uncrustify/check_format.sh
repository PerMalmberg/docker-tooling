if [ ! -d "$1" ]; then
    echo "Must provide a path to the location of uncrustify.cfg as first argument"
    exit 1
elif [ ! -d "$2" ]; then 
    echo "Must provide a source directory as second argument"
    exit 1
else
    docker run --rm \
               --mount type=bind,source="$1",target="/cfg" \
               --mount type=bind,source="$2",target="/src" \
               permalmberg/uncrustify:0.70.0
fi