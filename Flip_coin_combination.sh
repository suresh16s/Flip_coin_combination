#!/bin/bash -x
Flip=$((RANDOM % 2))
if [ $Flip -eq 1 ]
then
        echo "Head wins"
else
        echo "Tail wins"
fi
