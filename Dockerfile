FROM archlinux:latest
RUN pacman -Sy --noconfirm git make sudo  
ADD . /dist/
RUN git clone https://github.com/Thomashighbaugh/Dhumavati-Theme /dist/Dhumavati-Theme 
RUN cd dist/Dhumavati-Theme && make build &&  make install &&  make dist 
