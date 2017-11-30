# copy dotfiles
git clone git@github.com:Xixiao007/dotfiles-ubuntu.git ${HOME}/dotfiles
chmod +x ${HOME}/dotfiles/bootstrap.sh && ${HOME}/bootstrap.sh

# 1080 driver step 2
# stop the GUI
service lightdm stop 
# stop the X-server if it was already running, or nvidia will complain about it
killall xinit 
# download the latest nvidia drivers. At the time of this writing 367.35 was the latest
cd ~/Downloads/
wget us.download.nvidia.com/XFree86/Linux-x86_64/367.35/NVIDIA-Linux-x86_64-367.35.run 
# make the downloaded file an executable
chmod +x NVIDIA-Linux-x86_64-367.35.run 
# run the NVidia installer
./NVIDIA-Linux-x86_64-367.35.run 
# follow the prompts in the process
# once the process is over, reboot
shutdown -r now
