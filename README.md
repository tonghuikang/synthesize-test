# Installation
Tested on a GCP cloud VM with the following settings: <BR>
> Ubuntu 16.04 <BR>
> 20GB disk space <BR>
> 2vCPU 15GB RAM <BR>
> Firewalls: allow http and https traffic <BR>
> Networking: jupyter
  
Installation script
`curl https://raw.githubusercontent.com/tonghuikang/synthesize-test/master/install.sh | sudo bash`

Testing synthesis
```
git clone https://github.com/tonghuikang/synthesize-test
cd synthesize-test
fluidsynth -F ./test.wav GeneralUserGSv1.471.sf2 ./test.mid

# copy soundfonts to another folder for my other repo to reference
mkdir ~/soundfonts
cp *.sf2 ~/soundfonts/
```

### Error Log
`fluidsynth: warning: Failed to pin the sample data to RAM; swapping is possible.` <BR>
Not sure if this is a problem, but it seems to still work.


# About the soundfont
The source of the soundfont is http://www.schristiancollins.com/generaluser.php 
> You may use GeneralUser GS without restriction for your own music creation, private or commercial.  This SoundFont bank is provided to the community free of charge.  Please feel free to use it in your software projects, and to modify the SoundFont bank or its packaging to suit your needs.


