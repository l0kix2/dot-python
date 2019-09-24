pip2 install --upgrade pip
pip2 list --format=freeze 2> /dev/null | diff $HOME/.conf/py2-packages.txt - | grep '>' | grep -v pip | grep -v setuptools | awk '{print $2}' | awk -F '==' '{print $1}' | xargs -I{} pip2 uninstall {}
pip2 list --format=freeze 2> /dev/null | diff $HOME/.conf/py2-packages.txt - | grep '<' | grep -v '#' | awk '{print $2}' | xargs -I{} pip2 install {}
