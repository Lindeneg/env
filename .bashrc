# creates new python environment
penvn () {
    py -m venv $1
}

# activates python environment
penva () {
    source $1/Scripts/activate
}

# switches between python environments
penvs () {
    if [ -z $VIRTUAL_ENV ]
    then
        echo "No virtual environment is active"
        exit 0
    else
        deactivate $VIRTUAL_ENV
    fi
    penva $1
}

notebook () {
    py $VIRTUAL_ENV/Lib/site-packages/notebook
}

update_nvim_dotfile () {
    rm -rf /d/dev/dotfiles/nvim
    cp -r ~/AppData/Local/nvim /d/dev/dotfiles/nvim
}

update_bashrc_dotfile () {
    rm /d/dev/dotfiles/env/.bashrc
    cp ~/.bashrc /d/dev/dotfiles/env
}

update_dotfiles () {
    echo "Updating nvim cfg"
    update_nvim_dotfile
    echo "Updating .bashrc"
    update_bashrc_dotfile
}

# counts commit diff between current branch and a remote (default: master)
gdii () {
    local origin="master"
    if [ -z $1 ]
    then
        origin="master"
    else
        origin=$1
    fi

    local branch_name="$(git symbolic-ref HEAD 2>/dev/null)"  || branch_name="(unnamed branch)"
    local branch_name=${branch_name##refs/heads/}

    local result=$( git rev-list --left-right --count origin/$branch_name...origin/$origin )

    local infront=$(echo "$result" | awk '{print $1}')
    local behind=$(echo "$result" | awk '{print $2}')

    local pad_adjust=$(( ${#behind} - 1 ))
    local pad=$(( 7 - $pad_adjust ))
    local pad_result=""

    for (( i=0; i<$pad; i++ ))
    do
        pad_result+=" "
    done

    echo "BEHIND  INFRONT"
    echo "$behind$pad_result$infront"
}

# counts diff between two branches
gdi () {
    CURRENT=""
    BRANCH=""
    if [ -z $1 ]
    then
        BRANCH="master"
    else
        BRANCH=$1
    fi
    if [ -n $2 ]
    then
        CURRENT=$2
    fi
    git diff --stat ${CURRENT} ${BRANCH}
}

# show the diff of a PR
gprd () {
    if [ -z $1 ]
    then
        echo "Please specify a #PR"
    else
        gh pr diff $1 --color always
    fi
}

# sets environmental values from .env file
# (I love this fn, thank you Abdallah!)
envs () {
    ENV_FILE=".env"
    if [ $# -gt 0 ]
    then
        ENV_FILE=".env.$1"
    fi
    export $(grep -v '^#' $ENV_FILE)
}

alias cd2="cd ../../"
alias cd3="cd ../../../"
alias cd4="cd ../../../../"
alias dev="cd /d/dev/"
alias home="cd ~/"
alias make="mingw32-make.exe"
alias rc="source ~/.bashrc"
alias vi="nvim"
alias vim="nvim"
alias vv="vi ."
alias editali="vi ~/.bashrc"
alias editnvim="vi ~/AppData/Local/nvim"
alias gotonvim="cd ~/AppData/Local/nvim"
alias gotodotfiles="cd /d/dev/dotfiles"
alias searchali="cat ~/.bashrc | grep"
alias lg="lazygit"
alias hk="heroku"
alias dn='dotnet'
alias c="code"

alias g="git"
alias gl="g log --stat"
alias gc="git commit -m"
alias gca="git commit -a"
alias gp="g push"
alias gu="gp --set-upstream origin"
alias gb="g branch"
alias gs="g switch"
alias gr="g rebase master"
alias gfp="g push --force"
alias gt="g status"
alias gch="gh pr checkout"
alias gcm="g checkout master && g fetch && g pull"
alias gnb="gcm && gb -D dev && gb dev && gs dev && gu dev"
alias gpr="gh pr create -B master --body '' --title "
alias prc="gh pr checkout"
alias prs="gh pr checks"
alias prv="gh pr view"
alias prl="gh pr list"
alias pra="gh pr review"
alias gw="gh run"
alias gwl="gw list"
alias gwv="gw view"
alias gww="gw watch"
alias prm="gh pr merge --merge"
alias pru="git remote prune origin"
alias cls="clear"
alias la='ls -Alh' # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only
alias nc="ncat"
alias nd="npm run dev"
alias ns="npm run start"
alias yd="yarn dev"
alias ys="yarn start"
alias ye="yarn serve"
alias studio="yarn prisma studio"
alias gnl="npx generate-next-links@latest"
alias lua="lua52.exe"
alias gv="nvim-qt ."
alias b="./misc/build.sh"
alias r="./misc/run.sh"

export SDL2_PATH="D:/SDL/SDL2-2.28.4/x86_64-w64-mingw32"
export SDL2_IMAGE_PATH="D:/SDL/SDL2_image-2.8.1/x86_64-w64-mingw32"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
