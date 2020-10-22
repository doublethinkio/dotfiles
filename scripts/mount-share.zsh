#!/usr/bin/env zsh

vmhgfs-fuse -o allow_other -o auto_unmount .host:/share /home/doublethink/share
