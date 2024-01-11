= Installation of libreoffice with UI language packages

I tried to create libreoffice plus a UI with the German (de) language pack in the first place. Using the suggested installation procedure from the website was not successful.

If the following steps can be confirmed by others than me, the website should be updated.

The following is valid, if you first run an installation without UI and help. First time it takes long. These steps are much faster. And one can play around a little bit with options etc.

In the end, I was able to create the German UI as follows. I also found out how to install other languages I am interested in.

I am using at the moment <code>autogen.input</code> as follows:
                                                         
    --with-lang=de it fr
    --with-package-format=deb        
    --enable-epm                     
    --with-help                      

This is, what works so far: 

1. Run <code>./autogen.sh</code>:
 
    ./autogen.sh

2. Run <code>make</code>

    make

3. Run <code>make build-l10n-only</code>

    make build-l10n-only

This takes the first time a relative long duration of time, due to the fact, that all languages are cloned.

4. Make a copy of <code>README_en-US</code> at two locations and name them <code>README_qtz</code> as well as <code>README_de</code> etc. for each language.
The two locations are:

    /home/<user-dir>/libreoffice/instdir/readmes

    /home/<user-dir>/libreoffice/workdir/CustomTarget/readlicense_oo/readme

Without doing this <code>sudo make install</code> fails an tells <code>README_qtz</code> and <code>README_de</code> etc. are missing.

This issue is something like a bug (in the procedure). Without this bug libreoffice could be installed automatically. 
   
5. Finally running <code>sudo make install</code>

    sudo make install

results in 

    /usr/local/lib/libreoffice/program/soffice

with a German UI (and optional languages).

As result, now I can see <code>en-US</code> as well as <code>de</code> and the other languages for the installed user interfaces in the libreoffice settings. 

Now I can use again libreoffice as expected. Balloon help is working as well as help over <code>F1</code> works also as expected. 

It seems, that now also <code>*.deb</code> file are created in:

    /home/<user-dir>/libreoffice/workdir/CustomTarget/sysui/deb

