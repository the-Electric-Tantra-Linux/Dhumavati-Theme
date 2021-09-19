FROM archlinux:latest
RUN pacman -Sy --noconfirm git make sudo gtk2 gtk2-perl gtk3 gtk3-demos gtk4 gtk4-demos libcanberra inkscape optipng 
ADD . /dist/
RUN git clone https://github.com/Thomashighbaugh/Dhumavati-Theme /dist/Dhumavati-Theme 
RUN cd dist/Dhumavati-Theme && make build &&  make install &&  make dist 
