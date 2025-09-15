#!/bin/bash
git clone git://suckless.org/dwm
cd dwm/
patch -p1 < ../dwm-frivermen.diff
