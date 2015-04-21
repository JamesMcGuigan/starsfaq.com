# base-files version 4.0-4
# ~/.bashrc: executed by bash(1) for interactive shells.

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Cygwin specific commands
#if [[ `uname -o` == 'Cgywin' ]]; then
#    #/usr/local/bin/updatedb
#    #alias updatedb="updatedb --prunepaths='/proc /tmp /cygdrive/c/tmp /cygdrive/c/backup /cygdrive/c/cygwin /cygdrive/c/Documents.and.Settings/[^/]*/Local.Settings/Temp /cygdrive/c/Documents.and.Settings/[^/]*/Local.Settings/Temporary.Internet.Files /cygdrive/c/Documents.and.Settings/[^/]*/Local.Settings/Application.Data/Mozilla/Firefox/Profiles/[^/]*/Cache /cygdrive/[^/]*/System.Volume.Information /cygdrive/c/data/System.Volume.Information /cygdrive/c/backup/System.Volume.Information /cygdrive/c/shared/System.Volume.Information /cygdrive/c/program_disk/System.Volume.Information /cygdrive/d /cygdrive/e /cygdrive/g /cygdrive/h /cygdrive/p /cygdrive/q /cygdrive/s'"
#fi

export PATH="$PATH:~/bin"

export   SHELL=bash
export  EDITOR=vim
export   PAGER=less
export    LESS=-R
export GREP_OPTIONS='--color'

export HISTCONTROL=ignoredups      # don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoreboth      # ... and ignore same sucessive entries.
export PROMPT_COMMAND='history -a' # Whenever displaying the prompt, write the previous line to disk:
export COMP_CVS_REMOTE=1           # Define to access remotely checked-out files over passwordless ssh for CVS
export COMP_CONFIGURE_HINTS=1      # Define to avoid stripping description in --option=description of './configure --help'
export COMP_TAR_INTERNAL_PATHS=1   # Define to avoid flattening internal contents of tar files

# see http://www.caliban.org/bash/index.shtml
#shopt -s cdspell
#shopt -s checkwinsize
#shopt -s cmdhist
#shopt -s dotglob
#shopt -s extglob      # regexps for pattern matching
#shopt -s nocaseglob
shopt -s histappend                # Make Bash append rather than overwrite the history on disk
shopt -s checkwinsize  # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
#set -o ignoreeof      # Don't use ^D to exit
set -o notify          # Don't wait for job termination notification
set visible-stats on   # ls -F for bash-completion
unset USERNAME

bind 'C-u:kill-whole-line'              # Ctrl-U kills whole line
#bind 'set bell-style visible'           # No beeping
#bind 'set horizontal-scroll-mode on'    # Don't wrap
bind 'set show-all-if-ambiguous on'     # Tab once for complete
bind 'set visible-stats on'             # Show file info in complete

[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# don't let these commands disable aliases
alias sudo='sudo '
alias time='time '
alias nice='nice '

# sudo commands
alias port='sudo port '
alias fink='sudo fink '
alias apt-get='sudo fink '

# prefered options for commands
alias mv='mv -vi '
alias rm='rm -vi '
alias cp='cp -vi '
alias ln='ln -v '
alias ls='ls -C -F '
alias bc='bc -ql '
alias gvim='gvim -fn 6x10 '
alias nano='nano -w '
alias du='du -k '
alias df='df -kT '
alias bzip2='bzip2 -k '
#alias whois='whois -H '
alias skill='skill -v'
alias killall='killall -v'
alias vltl='vlt ' # common typo


## specific versions
##alias svn='/usr/bin/svn '
#svn() {
#    if [[ $1 == 'status' ]]; then
#        /usr/bin/svn "$@" | grep -v '^\?.*\(\.vimbackup\|\.sorting\)'
#    else
#        /usr/bin/svn "$@"
#    fi
#}

#  extra commands
alias path='echo -e ${PATH//:/\\n}'
alias background='xv -root -quit -max -rmode 5'    # Put a picture in the background
alias which='type -all'
alias ..='cd ..'
alias pinggoogle='time ping 66.102.11.104'
alias pingrouter='time ping 81.2.103.73'
alias pingrouter='time ping 192.168.1.1'
alias pingisp='time ping 90.155.53.6'
alias start='cygstart '

alias showhiddenfiles='defaults write com.apple.finder AppleShowAllFiles TRUE;  killall Finder'
alias hidehiddenfiles='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'





#functions
vi () { if   [ $1 == '' ];              then /usr/bin/vim
        elif [ ! -f $1 ] || [ -w $1  ]; then /usr/bin/vim $@;
        else
            echo -n "File is readonly. Edit as root? (Y/n): "
            read -n 1 yn; echo;
            if [ "$yn" = 'n' ] || [ "$yn" = 'N' ];
              then      /usr/bin/vim $*;
              else sudo /usr/bin/vim $*;
            fi
        fi
      }
show    () { for i in $*; do eval echo "\ \ \#\#  $i=\(\$$i\)";  done; }
field   () { awk "/.*/ {print \$$1} "; }
fields  () { fields=`echo $@ \
                   | sed 's/\(\w\)\s*/\$\1, /g' \
                   | sed 's/,\s*$//'`;
			awk "/.*/ {print $fields} ";
		  }

locatepwd() {
    locate $@ | grep `pwd`
}
function ctags_build () {
    cd ~/
    find /ft-cms/ -name "*.js" | xargs ctags -a
    #| grep -vP 'jquery|demo|fcke|ext|tinymce|servers|yui-'
}

function setdsm() {
    # add the current directory and the parent directory to PYTHONPATH
    # sets DJANGO_SETTINGS_MODULE
    export PYTHONPATH=$PYTHONPATH:$PWD/..
    export PYTHONPATH=$PYTHONPATH:$PWD
    if [ -z "$1" ]; then 
        x=${PWD/\/[^\/]*\/}
        export DJANGO_SETTINGS_MODULE=$x.settings
    else    
        export DJANGO_SETTINGS_MODULE=$1
    fi

    echo "DJANGO_SETTINGS_MODULE set to $DJANGO_SETTINGS_MODULE"
}


alias rgrepcss=' rgrep --include="*.css" '
alias rgrephtml='rgrep --include="*.html" '
alias rgrepjava='rgrep --include="*.java" '
alias rgrepjs='  rgrep --include="*.js" '
alias rgrepjsp=' rgrep --include="*.jsp" '
alias rgreppm='  rgrep --include="*.pm" '
alias rgrepxml=' rgrep --include="*.xml" '
alias rgrepjspm='rgrep --include="*.js" --include="*.pm" '
alias rgreppmjs='rgrep --include="*.js" --include="*.pm" '

function argc () {
    count=0;
    for arg in "$@"; do
        if [[ ! "$arg" =~ '-' ]]; then count=$(($count+1)); fi;
    done;
    echo $count;
}
#function rgrep () {
#    # TODO change into a find $dir -exec grep {}\; style command
#    if [[ `argc "$@"` < 2 ]]; then dir='./'; else dir=''; fi; # default to cwd if dir not supplied
#    GREP_COLOR='35;1' nice grep -rHIin --no-messages --color=always --exclude=".vimbackup" --exclude="*~" --exclude="*.sql" --exclude="*.tmp" --exclude="*.svn-base" --exclude="entries" --exclude="ctags" --exclude="functions" --exclude="debug.log" --exclude="sql.log" --exclude="Entries" --exclude="minified.*" --exclude=".#*" --exclude="*.bak" --exclude="jquery.js" "$@" $dir | grep -vP '^.{240}' | grep -v '/CVS/' | grep -v 'demo/' | grep -v '.vimbackup/'
#}

rgrep () {
    if [[ `argc "$@"` < 2 ]]; then dir='./'; else dir=''; fi; # default to cwd if dir not supplied
    GREP_COLOR='35;1' nice grep -rHIin --no-messages --color=always --exclude=\*.tmp --exclude=\*~ "$@" $dir | grep -v '.vimbackup\|.svn'
}
function fgrep () {
    rgrep --color=never -c $* | grep -v ':0' | perl -p -e 's/:\d+$//;'
}
function cvsmod () {
    cvs -n update $* 2> /dev/null | grep -P '^(M|C) '
}
function cvsfmod () {
    cvsmod $* | sed s/^..//
}
function cvswithtag () {
    if [[ `argc "$@"` == 0 ]]; then
        echo "Usage: cvswithtag <tag_regexp>";
    else
        cvs stat | awk '
            BEGIN {
                RS="Repository revision";
                "pwd" |& getline pwd; close("pwd");
                sub(/^.*\/www[^/]*\//, "", pwd);
            }
            /'$@'/ {
                file = $3;
                gsub(/\/cvs\/|,v/, "", file);
                sub(pwd, "", file);
                print file;
            }
        ';
    fi
}
function cvswithtagnotupdated () {
    if [[ `argc "$@"` == 0 ]]; then
        echo "Usage: cvswithtag <tag_regexp>";
    else
        cvs stat | awk '
            BEGIN {
                RS="Repository revision";
                "pwd" | getline pwd; close("pwd");
                sub(/^.*\/www[^/]*\//, "", pwd);
            }
            /'$@'/ {
                cur_ver  = $2;
                file     = $3; gsub(/\/cvs\/|,v/, "", file); sub(pwd, "", file);
                print $0;
                if( $0 ) {
                    command = "awk \"/'$@'/ { print; }\""
                    print command;
                    print | command | getline cur_line;
                    print cur_line;
                }
                print file, cur_ver, cur_line;
#                tag_line = $0; sub( /.*'$@'/, "$1", tag_line );
#
#                #tag_name = ( /'$@'[[:alnum:]_]*/, "XXX", tag_name );
#                #tag_name = $0; gsub(/^.*([a-z_]*'$@'[a-z_]*).*/is, "$1", tag_name);
#                #tag_ver  = $0; gsub(/^.*'$@'[^0-9]*([0-9.]+).*/i, "$1", tag_ver);
#
#                #tag_name_command = "echo $0 | awk \"/'$@'/ \" {                      print $1; exit } }";
#                #tag_ver_command  = "echo $0 | awk \"/'$@'/ \" { sub( /)/, \"\", $3); print $3; exit } }";
#                #tag_name_command |& readline tag_name; close(tag_name_command);
#                #tag_ver_command  |& readline tag_ver;  close(tag_ver_command);
#
#                #if( cur_ver > tag_ver ) {
#                    print "xxx ", file, cur_ver, " ||| ", tag_line
#                #}
            }
        ';
    fi
}

function headers () {
    server=$1; port=${2:-80}
    exec 5<> /dev/tcp/$server/$port
    echo -e "HEAD / HTTP/1.0\nHost: ${server}\n\n" >&5
    cat <&5
    exec 5<&-
}

# hangs when pointed to a closed port
testPort() {
    server=$1; port=$2; proto=${3:-tcp}
    exec 5<>/dev/$proto/$server/$port
    (( $? == 0 )) && exec 5<&-
}


# If not running interactively, don't do anything more
[ -z "$PS1" ] && return


# Define some colors first:
     RED='\[\e[31;1m\]'
   GREEN='\[\e[32;1m\]'
  YELLOW='\[\e[33;1m\]'
    BLUE='\[\e[34;1m\]'
  PURPLE='\[\e[35;1m\]'
    cyan='\[\e[36m\]'
    CYAN='\[\e[36;1m\]'
   WHITE='\[\e[37;1m\]'
      NC='\[\e[0m\]'
  DOLLAR='\$'
  if [ "$TERM" == "screen" ]; then SCREENPROMPT='\[\033k\033\\\]'; else SCREENPROMPT=''; fi;

# set a fancy prompt
#PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ $NC"
PS1="$CYAN[\t]$GREEN\u$WHITE@$GREEN\h$WHITE:$YELLOW\w$WHITE$SCREENPROMPT$DOLLAR $NC"
#PS1="$PURPLE[\t]${BLUE}dev$NC:\w$DOLLAR "
#PS1=$cyan'[\t] \[\e]0;\w\a\]\[\e[32m\]\u:\[\e[33m\]\w\[\e[0m\]\$ '
alias blackprompt='PS1="$BLUE[\t]$NC\u@\h$BOLD:$NC\w $DOLLAR "; ';

# wrap screen prompts around ssh and telnet commands
function ssh() {
    echo -n -e "\033k$1\033\134"
    /usr/bin/ssh $@
    echo -n -e "\033k`hostname`\033\134"
}
function telnet() {
    echo -n -e "\033k$1\033\134"
    /usr/bin/telnet $@
    echo -n -e "\033k`hostname`\033\134"
}



# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
dumb*)
	PS1='\u@\h:\w\$ '
	;;
*)
    ;;
esac



# welcome message
if [ "$TERM" != "dumb" ]; then
    if [ -f ~/.bash_alias ]; then
        . ~/.bash_alias
    fi

	if [ -x /usr/bin/fortune ]; then
        echo
        /usr/bin/fortune
        echo
	fi
    if [ -x /usr/bin/ddate ]; then
        echo
        /usr/bin/ddate
        echo
    fi
    if [ "$TERM" != "screen" ]; then
        /usr/bin/screen development
    fi
    if [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
	if [ -f ~/.bash_completion ]; then
		. ~/.bash_completion
	fi
	if [ -f ~/.bash_completion_grails ]; then
		. ~/.bash_completion_grails
	fi
    test -r /sw/bin/init.sh && . /sw/bin/init.sh
fi
