#!/bin/sh
# ------------------------------------------------------------------
# [Kevin Fowlks] 
#  
# 08/05/2015
#
# My dotbash Files in Git repo
#   This script links all of your home .bash files to the .bash directory maintained in Git.
#

NOW=$(date +"%m-%d-%Y")

BASH_FILES[0]=".bashrc"
BASH_FILES[1]=".bash_profile"
BASH_FILES[2]=".dir_color"

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

for filename in ${BASH_FILES[@]} do
  if [ -e $file_name ]
  then
      echo "Attempting to rename existing file $file_name"
      mv $filename "$filename_old_$NOW"
      check_errs $? "Failed to rename old $filename in home dir"
  fi

  ln -s $filename ~/$filename
  check_errs $? "Failed to link to $filename in home dir "

done
