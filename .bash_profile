

alias show_files='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide_files='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias bash='open ~/.bash_profile'
alias bash_history='open ~/.bash_history'
alias proc_gen='sysctl -n machdep.cpu.brand_string'
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --kiosk'

export DYLD_FRAMEWORK_PATH="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/System/Library/Frameworks"
export DYLD_LIBRARY_PATH="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/System/Library/Frameworks:
/usr/local/lib"



# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Add GHC 7.10.2 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.2.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# dynamic (shared) libraries (.dylib)
export LD_LIBRARY_PATH="/usr/local/lib" 
# static libraries (.a)
export LIBRARY_PATH="/usr/local/lib"
# header file 
export CPATH="/usr/local/include"

export PKG_CONFIG_PATH="/usr/local/Cellar/gmp/6.1.2"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/Cellar/openssl/1.0.2n"




##
# Your previous /Users/Charana/.bash_profile file was backed up as /Users/Charana/.bash_profile.macports-saved_2017-10-01_at_22:17:35
##

# MacPorts Installer addition on 2017-10-01_at_22:17:35: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:${PATH}"
# Finished adapting your PATH environment variable for use with MacPorts.

# added by Miniconda3 4.3.21 installer
export PATH="${PATH}:/Users/Charana/miniconda3/bin"

# Dynamic (Runtime) Intel OpenMP compiler libraries 
export DYLD_LIBRARY_PATH="${DYLD_LIBRARY_PATH}:/opt/intel/compilers_and_libraries_2018.0.104/mac/compiler/lib"

# Mac already supports sqlite3 in usr/local. Change PATH to find brew's sqlite3 executable alternative first
export PATH="/usr/local/opt/sqlite/bin:${PATH}"

# Add 'code' to PATH
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:${PATH}"




# Google Sound API
export GOOGLE_APPLICATION_CREDENTIALS="/Users/Charana/Desktop/Spy-Speak-69fd485f477e.json"
export GCLOUD_PROJECT="spy-speak-194720"

#OpenCL header file (for vc-code intellisense)
export PATH="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks/OpenCL.framework/Versions/A/Headers:${PATH}"

# Remove default as vim (the worst editor ever)
export EDITOR=vim
alias vi="nvim"
alias vim="nvim"

# Go build tool
export GOPATH="/Users/Charana/Desktop/StackHPC/go"

# Swap function
function swap()         
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home"

# top/htop configuration
alias top="top -o cpu"

# screen configuration
alias screen="screen-4.6.2"

# grep configuration
alias grep="grep -In --color"

# Use homebrew ctags (not MacOS CommandLineTools ctags)
alias ctags="`brew --prefix`/bin/ctags"

alias rm="trash"

function repeat()
{
    read -p "Enter command to repeat: " comm
    until $comm; do
        sleep 5
    done
}

