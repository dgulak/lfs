#!/bin/bash

cat > /etc/shells << EOF
# /etc/shells: valid login shells

/bin/sh
/bin/bash
/bin/zsh
EOF
