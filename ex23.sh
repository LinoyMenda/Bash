#! /bin/bash
# Linoy Menda 313302317
if [ "$1" != "system" ] &&  [ "$1" != "host" ] ; then
  echo "Invalid input"
else
  # if the second argument is empty string - so there is no flag
  if [ "$1" == "system" ] && [ -z "$2" ]; then
    cat os-release
  # else there is a flag to system
  else
    if [ "$1" == "system" ]; then
      flag=0
      # check if the command is appear more then once
      name=0
      version=0
      pretty_name=0
      home_url=0
      support_url=0
      # for loop start from second argument [zero is ./ex23.sh ,one is system]
      for arg in "${@: 2}"
      do
      case $arg in
      --name)
      if [ "$name" -eq "0" ]; then
        # find pattern and then seprate by delimiter "
        grep -w "NAME" os-release | awk -F '"' '{print $2}'
        flag=1
        name=1
      fi
      ;;
      --version)
      if [ "$version" -eq "0" ]; then
        grep -w "VERSION" os-release | awk -F '"' '{print $2}'
        flag=1
        version=1
      fi
      ;;
      --pretty_name)
        if [ "$pretty_name" -eq "0" ]; then
        grep -w "PRETTY_NAME" os-release | awk -F '"' '{print $2}'
        flag=1
        pretty_name=1
      fi
      ;;
      --home_url)
      if [ "$home_url" -eq "0" ]; then
        grep -w "HOME_URL" os-release | awk -F '"' '{print $2}'
        flag=1
        home_url=1
      fi
      ;;
      --support_url)
      if [ "$support_url" -eq "0" ]; then
        grep -w "SUPPORT_URL" os-release | awk -F '"' '{print $2}'
        flag=1
        support_url=1
      fi
      ;;
      esac
      done
      # if all flags do no belong to system command then print the file
      if [ "$flag" -eq "0" ]; then
        cat os-release
      fi
    fi
  fi
  # if the second argument is empty string - so there is no flag
  if [ "$1" == "host" ] && [ -z "$2" ]; then
    cat hostnamectl
    # else there is a flag to system
  else
    if [ "$1" == "host" ]; then
      flag=0
      # check if the command is appear more then once
      name=0
      static_hostname=0
      icon_name=0
      machine_id=0
      boot_id=0
      virtualization=0
      kernel=0
      architecture=0
      # for loop start from second argument [zero is ./ex23.sh ,one is host]
      for arg in "${@: 2}"
      do
      case $arg in
      --static_hostname)
      # print line after matching
      if [ "$static_hostname" -eq "0" ]; then
        grep -oP '(?<=Static hostname: ).*' hostnamectl
        flag=1
        static_hostname=1
      fi
      ;;
      --icon_name)
      if [ "$icon_name" -eq "0" ] && [ "$name" -eq "0" ]; then
        grep -oP '(?<=Icon name: ).*' hostnamectl
        flag=1
        icon_name=1
      fi
      ;;
      --name)
      if [ "$icon_name" -eq "0" ] && [ "$name" -eq "0" ]; then
        grep -oP '(?<=Icon name: ).*' hostnamectl
        flag=1
        name=1
      fi
      ;;
      --machine_id)
      if [ "$machine_id" -eq "0" ]; then
        grep -oP '(?<=Machine ID: ).*' hostnamectl
        flag=1
        machine_id=1
      fi
      ;;
      --boot_id)
      if [ "$boot_id" -eq "0" ]; then
        grep -oP '(?<=Boot ID: ).*' hostnamectl
        flag=1
        boot_id=1
      fi
      ;;
      --virtualization)
      if [ "$virtualization" -eq "0" ]; then
        grep -oP '(?<=Virtualization: ).*' hostnamectl
        flag=1
        virtualization=1
      fi
      ;;
      --kernel)
      if [ "$kernel" -eq "0" ]; then
        grep -oP '(?<=Kernel: ).*' hostnamectl
        flag=1
        kernel=1
      fi
      ;;
      --architecture)
      if [ "$architecture" -eq "0" ]; then
        grep -oP '(?<=Architecture: ).*' hostnamectl
        flag=1
        architecture=1
      fi
      ;;
      esac
      done
      # if all flags do no belong to host command then print the file
      if [ "$flag" -eq "0" ]; then
        cat hostnamectl
      fi
    fi
  fi
fi