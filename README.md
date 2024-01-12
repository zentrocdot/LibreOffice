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

Install the required dependencies for Debian and Ubuntu like systems:

    sudo apt-get install git build-essential zip ccache junit4 libkrb5-dev nasm graphviz python3 python3-dev 
    qtbase5-dev libkf5coreaddons-dev libkf5i18n-dev libkf5config-dev libkf5windowsystem-dev libkf5kio-dev 
    libqt5x11extras5-dev autoconf libcups2-dev libfontconfig1-dev gperf openjdk-17-jdk doxygen libxslt1-dev 
    xsltproc libxml2-utils libxrandr-dev libx11-dev bison flex libgtk-3-dev libgstreamer-plugins-base1.0-dev 
    libgstreamer1.0-dev ant ant-optional libnss3-dev libavahi-client-dev libxt-dev

test

    <code>sudo apt-get install git build-essential zip ccache junit4 libkrb5-dev nasm graphviz python3 python3-dev qtbase5-dev libkf5coreaddons-dev libkf5i18n-dev libkf5config-dev libkf5windowsystem-dev libkf5kio-dev libqt5x11extras5-dev autoconf libcups2-dev libfontconfig1-dev gperf openjdk-17-jdk doxygen libxslt1-dev xsltproc libxml2-utils libxrandr-dev libx11-dev bison flex libgtk-3-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev ant ant-optional libnss3-dev libavahi-client-dev libxt-dev</code>

# See also

[1] wiki.documentfoundation.org/Development/BuildingOnLinux

[2] https://translations.documentfoundation.org/


