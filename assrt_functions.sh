function install(){
  # usage: $install <apt pkg name>
  if [[ -n "$@" ]];then
    clear
    sudo apt update | lol && sudo apt install -y $1 | lolcat
  fi
}

function cl(){
  # Move to a dir and list the contents
  if [[ -n "$@" ]];then
      clear
      # Use your favourite ls switches
      cd $1 && ls -F --color=auto
  fi
}

function catc(){
  # Send cat command directly to system clipboard
  if [[ -n "$@" ]];then
      cat $1 | xclip -selection clipboard
  fi
}

function start_venv() {
    # Check for common venv directory names in current directory
    for venv_dir in venv .venv env .env; do
        if [[ -d "$venv_dir" ]] && [[ -f "$venv_dir/bin/activate" ]]; then
            source "$venv_dir/bin/activate"
            return 0  # Success
        fi
    done
    return 1  # No venv found
}
