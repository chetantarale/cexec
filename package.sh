#!/bin/bash -e

readonly VE_LOCATION=/tmp/cexec_pkg_ve

init_ve() {
	virtualenv --no-site-packages $VE_LOCATION
  virtualenv -p /usr/bin/python $VE_LOCATION
  source $VE_LOCATION/bin/activate
  pip install pyinstaller
  pip install -r requirements.txt
}

package() {
  sudo rm -r dist
  pyinstaller --clean --hidden-import=requests main.py
}

main() {
  init_ve
  package
}
sudo apt-get install -y python
main
