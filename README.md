# Motivation

By default, I have maintained and updated my operating system. The update also included an overdue system upgrade. Linux Mint LTS in the Cinnamon edition is installed. An upgrade was performed from version 20.03 codename Una (Ubuntu Focal) to version 21 codename Vanessa (Ubuntu Jammy). After the upgrade, I could no longer get LibreOffice to work in the usual ways. So I decided to build LibreOffice from source on my own on the computer. The result of my installation efforts can be found here.

# General procedure

The best way from the source code to the executable LibreOffice version seems to be realized in three steps.

1. Build LibreOffice from source code without special options

2. Add the language support for all known languages

3. Create the translated user defined UI's and the translated help files

I demonstrate this procedure by adding language support for my favorite languages German, Italian and French. Other languages can be added in the same way by other users.

# Starting point

The starting point for the installation is [1]. [2] is given for the sake of completeness. The procedure is valid for LibreOffice on Linux and BSD systems.

# Prerequisites

The required dependencies for Debian and Ubuntu like systems are:

<pre>
git build-essential zip ccache junit4 libkrb5-dev nasm graphviz python3 python3-dev qtbase5-dev libkf5coreaddons-dev
libkf5i18n-dev libkf5config-dev libkf5windowsystem-dev libkf5kio-dev libqt5x11extras5-dev autoconf libcups2-dev
libfontconfig1-dev gperf openjdk-17-jdk doxygen libxslt1-dev xsltproc libxml2-utils libxrandr-dev libx11-dev bison
flex libgtk-3-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev ant ant-optional libnss3-dev libavahi-client-dev
libxt-dev
</pre>

Install them on your system using sudo:

    sudo apt-get install git build-essential zip ccache junit4 libkrb5-dev nasm graphviz python3 python3-dev qtbase5-dev libkf5coreaddons-dev libkf5i18n-dev libkf5config-dev libkf5windowsystem-dev libkf5kio-dev libqt5x11extras5-dev autoconf libcups2-dev libfontconfig1-dev gperf openjdk-17-jdk doxygen libxslt1-dev xsltproc libxml2-utils libxrandr-dev libx11-dev bison flex libgtk-3-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev ant ant-optional libnss3-dev libavahi-client-dev libxt-dev

As stated gcc/g++ must be at least version 12. Do as super user

    sudo apt install gcc-12 g++-12 
    
and then do as super user

    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 60 --slave /usr/bin/g++ g++ /usr/bin/g++-12

If these steps run well we are prepared to build LibreOffice from source.

# Cloning and building

Goto to the home directory <code>$HOME</code> and clone the repository:

    git clone https://gerrit.libreoffice.org/core libreoffice

Change the directory:

    cd libreoffice

Then you can prepare the build files using:

    ./autogen.sh

I am using the following minmal version of <code>autogen.input</code>:

    --with-lang=de it fr
    --with-help 
    --with-package-format=deb        
    --enable-epm                     

The configuration file <code>autogen.input</code> is called automatically.            

Run first to get a working build:
   
    make

and then run 
    
    make check

In my case I got two JAVA errors, which did not influencing the installation yet.   

# Running the build

The previous listed steps created a local installation, which you can be started with:

    instdir/program/soffice

# Add the language support for the known languages

 Add the language support for the known languages in the directory tree of the source code:

   make build-l10n-only

Now, we are prepared to add the translated UI's and help files.

# Add the translated UI's and the help files

Run

    ./autogen.sh

Then run

    make

Then run again 

    make build-l10n-only

Make a copy of README_en-US at two locations and name them README_qtz as well as README_de etc. for each language. The two locations are:

    /home/<home-dir>/libreoffice/instdir/readmes</br>

    /home/<home-dir>/libreoffice/workdir/CustomTarget/readlicense_oo/readme

Without doing this sudo make install fails an tells README_qtz and README_de etc. are missing.

This issue is something like a bug (in the procedure). Without this bug libreoffice could be installed automatically.

Finally install everything

    sudo make install

This results in

    /usr/local/lib/libreoffice/program/soffice

with a German UI (and optional languages).

As result, now I can see en-US as well as de and the other languages for the installed user interfaces in the libreoffice settings.

# DEB package

The DEb packages are created in:

    /home/<home-dir>/libreoffice/workdir/CustomTarget/sysui/deb

# See also

[1] wiki.documentfoundation.org/Development/BuildingOnLinux

[2] translations.documentfoundation.org/


