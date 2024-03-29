# README

> [!NOTE]
> <p align="justify">The subsequently described installation procedure was tested from <code>Linux Mint 20.3 (Una)</code> up to <code>Linux Mint 21.3 (Virginia)</code>. The result was in all cases a running version of <code>LibreOffice</code> with help and language support. <code>LibreOffice</code> in version <code>24.8.0.0.alpha0+ (X86_64)</code> as <code>LibreOffice Community Release Version</code> will be installed. The installation procedure works as expected. I am running the <code>LibreOffice</code> developer version together with is shipped version from the Linux Mint installation [1].</p>

## Motivation

<p align="justify">By default, I have maintained and updated my operating system. The update also included an overdue system upgrade. <code>Linux Mint LTS</code> in the <code>Cinnamon Edition</code> is installed. An upgrade was performed from version <code>20.03</code> codename <code>Una</code> (<code>Ubuntu Focal</code>) to version <code>21</code> codename <code>Vanessa</code> (<code>Ubuntu Jammy</code>). After the upgrade, I could no longer get <code>LibreOffice</code> to work in the usual ways. So I decided to build <code>LibreOffice</code> from source on my own on the computer. The result of my installation efforts can be found here.</p>

## Introductary Words

<p align="justify">The whole installation procedure takes a while. On my last system with an AMD processor with six cores it took round about 4 hours for the installation as described. It should be noted that the available download data transfer speed influences the duration of the installation. Download and compilation needs the most time.</p>

> [!CAUTION]
> You are using the following description at your own risk. The described procedure has been tested several times and has led to the desired result for me. Of course, I cannot guarantee that this will work for you.

## Version Management

<p align="justify">The instruction is creating the developer version 24.8.0.0. Former versions are:</p>

*  New available version 24.2.0    
*  Second last version 7.6.5 
*  Linux Mint shipped version 7.3.7.2 

## General procedure

The best way from the source code to the executable <code>LibreOffice</code> version seems to be realized in three steps.

1. Build <code>LibreOffice</code> from source code without special options

2. Add the language support for all known languages

3. Create the translated user defined UI's and the translated help files

<p align="justify">I demonstrate this procedure by adding language support for my favorite languages <code>German</code>, <code>Italian</code> and <code>French</code> next to <code>English</code>. Other languages can be added in the same way by other users.</p>

## Starting point

The starting point for the installation is [3]. Reference [2] is given for the sake of completeness. The procedure is valid for <code>LibreOffice</code> on <code>Linux</code> and <code>BSD</code> systems.

## Prerequisites

The required dependencies for <code>Debian like</code> and <code>Ubuntu like</code> systems are:

<pre>
git build-essential zip ccache junit4 libkrb5-dev nasm graphviz python3 python3-dev qtbase5-dev
libkf5coreaddons-dev libkf5i18n-dev libkf5config-dev libkf5windowsystem-dev libkf5kio-dev
libqt5x11extras5-dev autoconf libcups2-dev libfontconfig1-dev gperf openjdk-17-jdk doxygen
libxslt1-dev xsltproc libxml2-utils libxrandr-dev libx11-dev bison flex libgtk-3-dev
libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev ant ant-optional libnss3-dev
libavahi-client-dev libxt-dev
</pre>

Install them on your system using sudo:

    sudo apt-get install git build-essential zip ccache junit4 libkrb5-dev nasm graphviz python3 python3-dev qtbase5-dev libkf5coreaddons-dev libkf5i18n-dev libkf5config-dev libkf5windowsystem-dev libkf5kio-dev libqt5x11extras5-dev autoconf libcups2-dev libfontconfig1-dev gperf openjdk-17-jdk doxygen libxslt1-dev xsltproc libxml2-utils libxrandr-dev libx11-dev bison flex libgtk-3-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev ant ant-optional libnss3-dev libavahi-client-dev libxt-dev

As stated gcc/g++ must be at least version 12. Do as super user

    sudo apt-get install gcc-12 g++-12 
    
and then do as super user

    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 60 --slave /usr/bin/g++ g++ /usr/bin/g++-12

If these steps run well we are prepared to build <code>LibreOffice</code> from source.

## Cloning and building

Goto to the home directory <code>$HOME</code> and clone the repository:

    git clone https://gerrit.libreoffice.org/core libreoffice

Change the directory:

    cd libreoffice

Then you can prepare the build files by running the command:

    ./autogen.sh

<p align="justify">The script <code>autogen.sh</code> is using a configuration file <code>autogen.input</code>. The configuration file <code>autogen.input</code> is called automatically. Make sure, that you do not use a <code>autogen.input</code> in the first run. 

> [!TIP]
> As I have explained the configuration file <code>autogen.input</code> is called automatically. Do not use a <code>autogen.input</code> configuration file in the first run. This approach has proved successful.  

Run <code>make</code> first to get a working build:
   
    make

After that run <code>make check</code>: 
    
    make check

## Errors from make check    

<p align="justify">First time when I installed libreoffice I got two JAVA errors, which did not influencing the installation yet. Next time I was able to run make check without errors. While installing on Linux Mint 21.3 I got again errors. This has to be checked, but did not influence the installation yet.</p>   

## Running the build

The previous listed steps created a local installation, which you can be started with:

    instdir/program/soffice

or

    $HOME/libreoffice/instdir/program/soffice

## Add the language support for the known languages

Add the language support for the known languages in the directory tree of the source code:

    make build-l10n-only

Now, we are prepared to add the translated UI's and help files.

## Add the translated UI's and the help files

Run the script <code>autogen.sh</code> without sudo

    ./autogen.sh
    
The configuration file <code>autogen.input</code> is called automatically. I am using now the following minmal version of <code>autogen.input</code>:

    --with-lang=de it fr
    --with-help 
    --with-package-format=deb        
    --enable-epm   

Then run <code>make</code>

    make

Then run <code>make</code> again 

    make build-l10n-only

Make a copy of README_en-US at two locations and name them README_qtz as well as README_de etc. for each language. The two locations are:

<pre>/home/&lt;home-dir&gt;/libreoffice/instdir/readmes</br>
/home/&lt;home-dir&gt;/libreoffice/workdir/CustomTarget/readlicense_oo/readme</pre>

Without doing this sudo make install fails an tells README_qtz and README_de etc. are missing.

The bash file readme_copy.bash takes over the copying of the missing README files.

This issue is something like a bug (in the procedure). Without this bug libreoffice could be installed automatically.

As result, now I can see en-US as well as de and the other languages for the installed user interfaces in the libreoffice settings.

## Running the build

The previous listed steps created a local installation, which you can be started with:

    instdir/program/soffice

or

    $HOME/libreoffice/instdir/program/soffice

## Final installation
    
Finally install everything

    sudo make install

This results in

    /usr/local/lib/libreoffice/program/soffice

with a German UI (and optional languages).
    

## DEB package

The DEB packages are created in:

    /home/<home-dir>/libreoffice/workdir/installation/LibreOffice/deb/install

<p align="justify">The DEB package creation is not working as expected. The DEB packages can be used and they are recognised as DEB packages, but they do not install LibreOffice in the expected way. This has to be checked.</p>

## Workaround

<p align="justify">Due to the fact, that the DEB packages cannot be used, I am using the following workaround. I am creating a starter on the desktop and using the icon of the correct installed official libreoffice installation.</p>

## To-Do

<p align="justify">On my to-do list is one issue of interest. How can I get a DEB package, which can be used for installation as well as distribution in principle.</p>

<p align="justify">Exploring the possibilities of the <code>autogen.input</code> configuration file.</p>

## Conclusion

<p align="justify">I have a version of <code>LibreOffice</code> installed on my computer that works better than any version I have worked with before.</p>

## See also

[1]    linuxmint.com/download_all.php

[2]    translations.documentfoundation.org/

[3]    wiki.documentfoundation.org/Development/BuildingOnLinux

[4]    www&#8203;.libreoffice.org/download/pre-releases/

[5]   www&#8203;.libreoffice.org/download/download-libreoffice/

[6]    dev.blog.documentfoundation.org/2023/07/30/ccache-for-a-5-minutes-libreoffice-build/

[7]    wiki.documentfoundation.org/ReleaseNotes/24.8

[8]    wiki.documentfoundation.org/Development/How_to_build

[9]    wiki.documentfoundation.org/Development/GenericBuildingHints

[10]    wiki.documentfoundation.org/Development/ReleaseBuilds

[11]    wiki.documentfoundation.org/Development/Configuration_options

[12]    wiki.documentfoundation.org/Language

[13]     www&#8203;.spinics.net/lists/libreoffice/msg08322.html

[14]    lists.freedesktop.org/archives/libreoffice/2023-February/089917.html

[15]    blog.documentfoundation.org/blog/2019/06/12/start-developing-libreoffice-download-the-source-code-and-build-on-linux/

> [!TIP]
> I will shortly be making a small PDF and small e-book available via Buymeacoffee that builds on this description. It will contain further information about the described installation and and things beyond that.  

<hr width="100%" size="2">

<p align="center">I loved the time when you could get also a hamburger :hamburger: for one euro!</p>

<p align="center">
<a target="_blank" href="https://www.buymeacoffee.com/zentrocdot"><img src="greeen-button.png" alt="Buy Me A Coffee" height="41" width="174"></a>
</p>

<hr width="100%" size="2">

## Other ways to donate

<p align="justify">If you like what I present here, or if it helps you, or if it is useful, you are welcome to donate a small contribution or a cup of coffee. Or as you might say: Every TRON counts! Many thanks in advance! :smiley:</p>

<pre>TQamF8Q3z63sVFWiXgn2pzpWyhkQJhRtW7            (TRON)
DMh7EXf7XbibFFsqaAetdQQ77Zb5TVCXiX            (DOGE)
12JsKesep3yuDpmrcXCxXu7EQJkRaAvsc5            (BITCOIN)
0x31042e2F3AE241093e0387b41C6910B11d94f7ec    (Ethereum)</pre>
    
<hr width="100%" size="2">

<p align="center">File last modified 27/02/2024</p>

