# uninstall versions that not presented in python-versions file 
pyenv versions 2>/dev/null | grep -v system | cut -c3- | awk '{print $1}' | diff ~/.python-version - | grep '>' | awk '{print $2}' | xargs -I{} pyenv uninstall -f {}
# install versions that presented in python-versions file and yet not installed
pyenv versions 2>/dev/null | grep -v system | cut -c3- | awk '{print $1}' | diff ~/.python-version - | grep '<' | awk '{print $2}' | xargs -I{} pyenv install {}
