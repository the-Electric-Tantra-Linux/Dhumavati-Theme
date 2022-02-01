#!/bin/bash
#  _____              __
# |     \.-----.----.|  |--.-----.----.
# |  --  |  _  |  __||    <|  -__|   _|
# |_____/|_____|____||__|__|_____|__|

#  ______         __ __     __
# |   __ \.--.--.|__|  |.--|  |
# |   __ <|  |  ||  |  ||  _  |
# |______/|_____||__|__||_____|

#  _______             __         __
# |     __|.----.----.|__|.-----.|  |_
# |__     ||  __|   _||  ||  _  ||   _|
# |_______||____|__|  |__||   __||____|
#                         |__|
###########################################################################
###########################################################################
###########################################################################
# This script serves as an entrypoint to using docker to build the theme variants and not clog the local system with its artifacts.

# First output candy for the script's echo statements
cr="$(tput setaf 1)"
cg="$(tput setaf 2)"
cy="$(tput setaf 3)"
cm="$(tput setaf 5)"
sb="$(tput bold)"
sn="$(tput sgr0)"

print() {
    case "$1" in
    t | title)
        shift
        printf "%s\n" "${sb}${cg}[###]$*${sn}"
        ;;
    s | step)
        shift
        printf "%s\n" "${sb}${cm}[===]$*${sn}"
        ;;
    e | error)
        shift
        printf "%s\n" "${sb}${cr}[!!!]$*${sn}"
        exit 1
        ;;
    w | warning)
        shift
        printf "%s\n" "${sb}${cy}[:::]$*${sn}"
        ;;
    *)
        printf '%s\n' "$*"
        ;;
    esac
}

print t "Docker Entrypoint Script"
print s "---------------------------------"
print s "---------------------------------"
print s "---------------------------------"
print s "Building GTK Theme Within Docker Container"
#  Builds the GTK theme variants and dumps them in /out
#

mkdir -p "$PWD"/out
DOCKER_BUILDKIT=1 docker build --output type=tar,dest=out.tar .
#sudo docker cp dhumavati:latest:/dist "$PWD"/out

print s "The files from the build should be available within the out directory"
print s "---------------------------------"
print s "---------------------------------"
print s "---------------------------------"
print s "Changing permissions of the output files."
# Because within the container, everything was built by root, this enables the use of the themes in the user repository and my ability to release them on Github
#
sudo chown -Rv 777 "$PWD"/out
print s "---------------------------------"
print s "---------------------------------"
print s "---------------------------------"
print s "Installing the theme locally"
## This will go into the directory that the files were dumped into and run the Makefile's install command
cd "$PWD"/out/dist/Dhumavati-Theme && sudo make install

print s "---------------------------------"
print s "---------------------------------"
print s "---------------------------------"
print t "The themes should now be installed and ready for use locally."
