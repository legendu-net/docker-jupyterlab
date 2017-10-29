#!/bin/bash

dir=/jupyter
inotifywait -m -r -e create --format '%w%f' "$dir" | while read f; do
#    if [[ "$f" == */.ipynb_checkpoints ]]; then
    if [[ -d "$f" ]]; then
        chmod 775 "$f"
    fi
done
