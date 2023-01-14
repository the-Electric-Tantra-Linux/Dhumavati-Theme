FROM archlinux:latest
LABEL maintainer="Thomas Leon Highbaugh <thighbaugh@zoho.com>"
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm git base-devel make sudo gtk2 gtk2-perl gtk3 gtk3-demos gtk4 gtk4-demos libcanberra inkscape optipng sassc ruby-sassc
RUN mkdir /dist/
RUN git clone https://github.com/Thomashighbaugh/Dhumavati-Theme /dist/Dhumavati-Theme
RUN cd dist/Dhumavati-Theme && make build && make install && make dist
