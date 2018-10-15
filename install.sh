#!/bin/bash
export LC_ALL=C
echo 'Updating repository...'
sudo apt update
echo 'Upgrading packages...'
sudo apt upgrade -y && sudo apt dist-upgrade -y
echo 'Cleaning up...'
sudo apt autoremove -y && sudo apt clean
echo 'Done! Moving on with install.'

echo 'Installing Python (system default, probably 3.5) ...'
sudo apt install git python3-dev python3-pip python-dev python-pip -y

echo 'Now installing Python 3 libraries:'
sudo pip3 install setuptools pip wheel --upgrade
sudo pip3 install numpy scipy matplotlib jupyter ipywidgets pillow
sudo pip3 install bcolz seaborn pandas sklearn keras tensorflow
sudo pip3 install opencv-contrib-python
sudo rm -R ~/.jupyter
echo '... enabling widgets for Jupyter'
jupyter nbextension enable --py widgetsnbextension --sys-prefix
echo '... generating config'
jupyter notebook --generate-config
echo 'Jupyter Notebook will be made accessible from:'
sudo ifconfig | grep inet
echo "c.NotebookApp.ip = '*'" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> ~/.jupyter/jupyter_notebook_config.py
echo 'Done!'

echo 'Configuring firewall (ufw) to allow ports 8888 and 8889'
sudo ufw allow 8888
sudo ufw allow 8889

echo 'For synthesizing sound'
sudo apt-get build-dep fluidsynth --no-install-recommends -y
sudo apt-get install fluidsynth -y

echo 'For the transcription notebooks'
sudo pip3 install pysndfx librosa matplotlib
