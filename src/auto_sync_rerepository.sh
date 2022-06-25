#!/bin/bash
cd tree-climbing-course/
expect -c "
spawn git fetch -a
expect \"Username for 'https://gitlab.com': \"
send \"username\r\"
expect \"Password for 'https://username@gitlab.com': \"
send \"Password\r\"
spawn git remote prune origin
expect \"Username for 'https://gitlab.com': \"
send \"username\r\"
expect \"Password for 'https://username@gitlab.com': \"
send \"Password\r\"
"
