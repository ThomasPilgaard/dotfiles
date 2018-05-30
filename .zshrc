# Path to your oh-my-zsh installation.
export ZSH=/home/thomas/.oh-my-zsh
export DEFAULT_USER=thomas

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export JAVA_HOME=/usr/lib/jvm/default-java
export JAVACMD=/usr/lib/jvm/default-java/bin/java
export PATH="/opt/android-studio/bin:$PATH"
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH=$PATH:/opt/gradle/gradle-4.6/bin
export PATH=$PATH:/home/thomas/Documents/dencrypt_talk/android-ndk-r11c

export LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:ex=00;35"

export LD_LIBRARY_PATH=/home/thomas/Documents/dencryot_msg_console/dencrypt-message-sdk/submodules/mbedtls/build/debug/debian/x86_64/lib

# ZSH_THEME="cloud"
ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh
# source /usr/share/zplug/init.zsh

# zplug "plugins/git", from:oh-my-zsh
# zplug 'dracula/zsh', as:theme
# zplug "zsh-users/zsh-autosuggestions"
# zplug "themes/cloud", from:oh-my-zsh

# zplug load --verbose

EDITOR=vim

togglepad()
{
    xinput_str="$(xinput)"
    touchpad_id="$(echo $xinput_str | grep "SynPS/2 Synaptics TouchPad" | grep -o "id=[[:digit:]][[:digit:]]" | grep -o "[[:digit:]][[:digit:]]")"
    extrabtn_id="$(echo $xinput_str | grep "PS/2 Generic Mouse" | grep -o "id=[[:digit:]][[:digit:]]" | grep -o "[[:digit:]][[:digit:]]")"
    # echo $touchpad_id
    # echo $extrabtn_id
	state=`xinput list-props $touchpad_id | grep "Device Enabled" | grep -o "[01]$"`
	if [ $state = '1' ]; then
		xinput --disable $extrabtn_id
		xinput --disable $touchpad_id # If $touchpad_id is disabled first, it have to be run two times, wat.
		echo "Touchpad disabled"
	else
		xinput --enable $touchpad_id
		xinput --enable $extrabtn_id
		echo "Touchpad enabled"
	fi
}

set-gov()
{
    sudo cpufreq-set -c 0 -g $1
    sudo cpufreq-set -c 1 -g $1
    sudo cpufreq-set -c 2 -g $1
    sudo cpufreq-set -c 3 -g $1
}

get-gov()
{
    echo "gov"
}

ark() {
	case $1 in
		e)
			case $2 in
				*.tar.bz2)   tar xvjf $2      ;;
				*.tar.gz)    tar xvzf $2      ;;
				*.bz2)       bunzip2 $2       ;;
				*.rar)       unrar x $2       ;;
				*.gz)        gunzip $2        ;;
				*.tar)       tar xvf $2       ;;
				*.tbz2)      tar xvjf $2      ;;
				*.tgz)       tar xvzf $2      ;;
				*.zip)       unzip $2         ;;
				*.Z)         uncompress $2    ;;
				*.7z)        7z x $2          ;;
				*)           echo "'$2' Unrecognized archive type" ;;
			esac ;;

		c)
			case $2 in
				*.tar.*)    arch=$2; shift 2;
					tar cvf ${arch%.*} $@
					case $arch in
						*.gz)   gzip -9r ${arch%.*}   ;;
						*.bz2)  bzip2 -9zv ${arch%.*} ;;
					esac                                ;;
				*.rar)      shift; rar a -m5 -r $@; rar k $1    ;;
				*.zip)      shift; zip -9r $@                   ;;
				*.7z)       shift; 7z a -mx9 $@                 ;;
				*)          echo "Unrecognized archive type"      ;;
			esac ;;

		*)
			echo "WHAT?" ;;
	esac
} # }}}

remove_docker_images() {
    if [[ -n $(docker ps -a -q) ]]; then
        docker rm $(docker ps -a -q)
    fi
    if [[ -n $(docker images -a -q) ]]; then
        docker rmi $(docker images -a -q)
    fi
}


source ~/.aliases

