FROM ubuntu:16.04
RUN dpkg --add-architecture i386
RUN apt-get update -qq && apt-get -y install wget mesa-utils file cabextract
RUN apt-get install --force-yes -y x-window-system

RUN apt-get install -y \
	wine \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*
RUN wget https://downloads.cncnet.org/cncnet_1.0_all.deb && dpkg -i cncnet_1.0_all.deb
RUN wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && chmod +x winetricks && mv winetricks /usr/local/bin
RUN winetricks corefonts
WORKDIR /usr/games
RUN useradd --create-home user
USER user
ENTRYPOINT [ "/bin/bash" ]
