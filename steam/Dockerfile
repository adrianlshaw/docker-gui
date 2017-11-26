FROM ubuntu:16.04
RUN dpkg --add-architecture i386
RUN apt-get update -qq && apt-get -y install wget mesa-utils file cabextract software-properties-common apt-transport-https
RUN apt-get install --force-yes -y x-window-system

RUN wget -nc https://dl.winehq.org/wine-builds/Release.key && apt-key add Release.key
RUN apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
RUN apt-get update -qq
RUN apt-get install -y --install-recommends winehq-stable
RUN wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && chmod +x winetricks && mv winetricks /usr/local/bin
ENV WINEARCH win32
RUN winetricks corefonts
RUN useradd --create-home user
RUN wget https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe
WORKDIR /root/
ENV WINEDEBUG -all
RUN wine reg add "HKLM\\System\\CurrentControlSet\\Control\\Session Manager\\Memory Management\\" /v PagedPoolSize /t REG_DWORD /d 402653184 /f
RUN wine reg add 'HKCU\Software\Valve\Steam' /v DWriteEnable /t REG_DWORD /d 00000000
ENTRYPOINT [ "/bin/bash" ]
# wine -no-dwrite
