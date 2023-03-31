# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

if [[ -z "${TMUX}" ]] && [[ "$(ps -e -o comm= | grep tmux)" != "tmux" ]]; then
	    tmux
fi

PATH="/opt/idea-IU-223.8836.41/bin:$PATH"

function idea {
	idea.sh
}

copyToClipboard() {
  if ! command -v xclip &> /dev/null
  then
      echo "xclip is not installed. Install it to use this command."
      return 1
  else
      cat "$1" | xclip -sel clip
      echo "Contents of $1 copied to clipboard."
  fi
}

