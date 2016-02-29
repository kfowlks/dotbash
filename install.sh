#!/bin/bash
# ------------------------------------------------------------------
#   Author [Kevin Fowlks] 
#  
#   Date 08/05/2015
#
#   My dotbash Files in Git repo
#
#   This script links all of your home .bash files to the .bash directory maintained in Git.
#   The script is written in (sh)ell so that it can be installed without needing BASH 
#   installed. 
#   
#   Usage: ./install {Must be run from install dir}

NOW=$(date +"%m%d%Y")

BASH_FILES[0]=".bashrc"
BASH_FILES[1]=".bash_profile"
BASH_FILES[2]=".dir_colors"

check_errs()
{
    # Function. Parameter 1 is the return code
      # Para. 2 is text to display on failure.
        if [ "${1}" -ne "0" ]; then
          echo "ERROR # ${1} : ${2}"
          # as a bonus, make our script exit with the right error code.
          exit ${1}
        fi
}


for filename in ${BASH_FILES[@]} ; do

  if [ -h ~/$filename ]; then
    echo "Attempting to unlink existing link $filename"
    unlink ~/$filename
    check_errs $? "Failed to unlink file $filename"
  fi 

  if [ -f ~/$filename ]; then
      echo "Attempting to rename existing file"
      mv ~/$filename ~/"$filename-old-$NOW"
      check_errs $? "Failed to rename old $filename to$filename-old-$NOW"
  fi

  ln -s ~/.bash/$filename ~/$filename
  check_errs $? "Failed to link to $filename in $HOME"

done

echo "dotbash has been successfully installed!"
