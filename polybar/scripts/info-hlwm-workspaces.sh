#!/usr/bin/env bash

herbstclient --idle "tag_*" 2>/dev/null | {

    while true; do
        # Read tags into $tags as array
        IFS=$'\t' read -ra tags <<< "$(herbstclient tag_status)"
        {
            for i in "${tags[@]}" ; do
                # Read the prefix from each tag and render them according to that prefix
                case ${i:0:1} in
                    '#')
                        # the tag is viewed on the focused monitor
                        echo '%{F#00e59b}'
                        ;;
                    ':')
                        # : the tag is not empty
                        echo '%{F#c0c0c0}'
                        ;;
                    '!')
                        # ! the tag contains an urgent window
			echo '%{F#bd2c40}'
                        ;;
                    '-')
                        # - the tag is viewed on a monitor that is not focused
                        echo '%{F#c0c0c0}'
                        ;;
                    *)
                        # . the tag is empty
                        # There are also other possible prefixes but they won't appear here
                        echo "%{F-}%{B-}" # Add your formatting tags for empty workspaces
                        echo '%{F#5d5d6c}'
                        ;;
                esac

                echo "%{A1:herbstclient use ${i:1}:}  ${i:1}  %{A -u -o F- B-}"
            done

            echo "%{F-}%{B-}"
        } | tr -d "\n"

    echo

    # wait for next event from herbstclient --idle
    read -r || break
done
} 2>/dev/null
